#include "mex.h"
#include <cmath>

// diffs = sumSqDiffBtwWin(I,windowSize);
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
	/* Takes a zero-padded image and a filter window size.
	 * Outputs the matrix of squared, summed pixel differences between each
	 * pair of windows. */
	
	// declare variables
  double *zIz; // padded image
	double *windowSize; // size of filter window
	double *diffs2; // output matrix
	int *zizSz; // size of padded image zIz
	int iSz[2]; // size of un-padded image
	int outSz[2]; // size of output matrix

  // error checking on argument numbers
  if( nrhs!=2 ) mexErrMsgTxt("Four inputs expected.");
  if( nlhs>1 ) mexErrMsgTxt("One output expected.");
	
	// get size of I
  zizSz = (int*) mxGetDimensions(prhs[0]);
	// assert size and type are supported
  if( (mxGetNumberOfDimensions(prhs[0])!=2) ||
    (mxGetClassID(prhs[0])!=mxDOUBLE_CLASS) )
    mexErrMsgTxt("I should be a 2D double array.");
	// get I
	zIz=(double*)mxGetData(prhs[0]);
	
	// get size of windowSize
  int* wsSz = (int*) mxGetDimensions(prhs[1]);
	// assert size and type are supported
  if( (mxGetNumberOfDimensions(prhs[1])!=2) ||
    (mxGetClassID(prhs[1])!=mxDOUBLE_CLASS) ||
		(wsSz[0]!=1) || (wsSz[1]!=2) )
    mexErrMsgTxt("windowSize should be a 1-by-2 double array.");
	// get windowSize
	windowSize=(double*)mxGetData(prhs[1]);
	
	// compute un-padded image size
	iSz[0] = zizSz[0]-(int)windowSize[0]+1;
	iSz[1] = zizSz[1]-(int)windowSize[1]+1;
	
	// compute output matrix size
	outSz[0] = iSz[0]*iSz[1];
	outSz[1] = iSz[0]*iSz[1];
	
  // create output array
  plhs[0] = mxCreateNumericArray(2, (const mwSize*) outSz, mxDOUBLE_CLASS, mxREAL);
	diffs2 = (double*)mxGetData(plhs[0]);
	
	// for each image pixel
	for (int u1=0; u1<iSz[0];  u1++) {
		for (int v1=0; v1<iSz[1]; v1++) {
			// for each image pixel (do not repeat)
			for (int u2=u1; u2<iSz[0]; u2++) {
				for (int v2=(u2==u1)?v1:0 ; v2<iSz[1]; v2++) {
					// for each window pixel
					for (int i=0; i<(int)windowSize[0]; i++) {
						for (int j=0; j<(int)windowSize[1]; j++) {
							// add squared pixel difference to accumulator
							diffs2[u1+iSz[0]*v1+outSz[0]*(u2+iSz[0]*v2)] += pow(zIz[(u1+i)+zizSz[0]*(v1+j)]-zIz[(u2+i)+zizSz[0]*(v2+j)],2);
						}
					}
				}
			}
		}
	}
}