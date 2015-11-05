ds = prtDataGenUnimodal;
plot(ds)
x = [66,70,71;65,76,74;64,73,72;64,70,69;65,65,74;66,73,71;68,68,74;63,68,67;69,72,70;61,67,68;65,68,68;65,72,73;68,75,70;63,63,67]
features = x(:,1:2)
labels = x(:,3)>69
ds = prtDataSetClass(features,labels)
plot(ds)
ds.featureNames = {'mom height','dad height'}
plot(ds)
ds.classNames = {'short','tall'}
plot(ds)
clf = prtClassLibsvm;
clf = prtClassLibSvm;
clf_Trained = train(clf,ds);
plot(clf_Trained)
clf = prtClassPlsda;
clf_Trained = train(clf,ds);
plot(clf_Trained)
axis equal tight
clf = prtClassPlsda+prtDecisionMap;
clf_Trained = train(clf,ds);
plot(clf_Trained)
results = clf.kfolds(ds,3);
prtScoreRoc(results)
axis equal tight