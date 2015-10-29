% inverse transform sampling example

%% setup
nSamples = 10000;
uniformSamples = rand(nSamples,1);
lambda = 1;

%%
p = @(x) lambda*exp(-lambda*x)
ezplot(p)

%%
P = @(x)1-exp(-lambda*x)
ezplot(P,[0,10])

%%
Q = @(y)-1/lambda*log(1-y)
ezplot(Q,[0,1])

expSamples = Q(uniformSamples)
hist(Q,0:10)
hist(expSamples)
hist(uniformSamples)
hist(expSamples)
hist(expSamples,0.5:1:9.5), hold on, plot(0:0.5:10,p(0:0.5:10)), hold off
hist(expSamples,0.5:1:9.5), hold on, plot(0:0.5:10,p(0:0.5:10)*nSamples), hold off
P
R = @(x)P(Q(x))
ezplot(R)
samples = P(Q(uniformSamples))
uniformSamples
expSamples = exprnd(1,[nSamples,1])
samples = P(expSamples)
hist(expSamples)
hist(samples)


