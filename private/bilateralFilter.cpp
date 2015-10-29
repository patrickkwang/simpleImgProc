#include "mex.h"
#include <cmath>

#include <iostream>

// diffs = sumSqDiffBtwWin(I,windowSize);
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
	/* Takes a zero-padded image and a filter window size.
	 * Outputs the matrix of squared, summed pixel differences between each
	 * pair of windows. */
	
	// declare variables
  double *zIz; // zero-padded image
	double *windowSizeTmp; // size of filter window
	int windowSize[2]; // size of filter window
	double *out; // output matrix
	int *zizSz; // size of padded image zIz
	int iSz[2]; // size of un-padded image
	int padding[2]; // padded size (on each side)
	int outSz[2]; // size of output matrix
	double sigma_i; // standard deviation for intensity weighting
	double sigma_d; // standard deviation for distance weighting
	double winWeightSum; // sum of filter weights, for normalization
	int weightSz[2]; //
	double Ic; // temporary image window holder
	
  // error checking on argument numbers
  if( nrhs!=4 ) mexErrMsgTxt("Four inputs expected.");
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
	windowSizeTmp = (double*)mxGetData(prhs[1]);
	windowSize[0] = (int)windowSizeTmp[0];
	windowSize[1] = (int)windowSizeTmp[1];
	
	// get sigma_d
	sigma_d=(double)mxGetScalar(prhs[2]);
	
	// get sigma_i
	sigma_i=(double)mxGetScalar(prhs[3]);
	
	// compute un-padded image size
	iSz[0] = zizSz[0]-windowSize[0]+1;
	iSz[1] = zizSz[1]-windowSize[1]+1;
	padding[0] = (windowSize[0]-1)/2;
	padding[1] = (windowSize[1]-1)/2;
	
	// compute output matrix size
	outSz[0] = iSz[0];
	outSz[1] = iSz[1];
	
  // create output array
  plhs[0] = mxCreateNumericArray(2, (const mwSize*) outSz, mxDOUBLE_CLASS, mxREAL);
	out = (double*)mxGetData(plhs[0]);
	
	// declare things whose size depends on input
	double winWeightD[windowSize[0]*windowSize[1]];
	double winWeightI[windowSize[0]*windowSize[1]];
	double winWeight[windowSize[0]*windowSize[1]];
	
	// for each window pixel
	for (int i=0; i<windowSize[0]; i++) {
		for (int j=0; j<windowSize[1]; j++) {
			winWeightD[i+windowSize[0]*j] = exp(-0.5*(pow(i-padding[0],2)+pow(j-padding[1],2))/pow(sigma_d,2));
		}
	}
	
	// for each image pixel
	for (int u1=0; u1<iSz[0];  u1++) {
		for (int v1=0; v1<iSz[1]; v1++) {
			Ic = zIz[u1+padding[0]+zizSz[0]*(v1+padding[1])];
			winWeightSum = 0;
			// for each window pixel
			for (int i=0; i<windowSize[0]; i++) {
				for (int j=0; j<windowSize[1]; j++) {
					// compute pixel contribution to result at [u1,v1]
					winWeightI[i+windowSize[0]*j] = exp(-0.5*pow(zIz[(u1+i)+zizSz[0]*(v1+j)]-Ic,2)/pow(sigma_i,2));
					winWeight[i+windowSize[0]*j] = winWeightI[i+windowSize[0]*j] * winWeightD[i+windowSize[0]*j];
					winWeightSum += winWeight[i+windowSize[0]*j];
				}
			}
			// for each window pixel
			for (int i=0; i<windowSize[0]; i++) {
				for (int j=0; j<windowSize[1]; j++) {
					// add squared pixel difference to accumulator
					out[u1+iSz[0]*v1] += zIz[(u1+i)+zizSz[0]*(v1+j)]*winWeight[i+windowSize[0]*j]/winWeightSum;
				}
			}
		}
	}
}
