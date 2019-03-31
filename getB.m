function [B,cost,y,x,Y] = getB(X,numEpochs,alfa,target)

s = size(X,1);

B = zeros(6,1);

x = [ones(s,1) X(:,4:8)];
Y = X(:,1);
 
cost = zeros(1,numEpochs);

for i= 1:numEpochs

    score = x*B;
    y = sigmoid(score);
    
    J = (-sum(target.*log(y))-sum((1-target).*log(1-y)))/s;
    
    B_gradient = x'*(target-y)/s;
    B = B + alfa*B_gradient;

    cost(i) = J;
end

end

    
    