function y_hat = testB(B,X)
    
    x = [ones(size(X,1),1) X(:,4:8)];

    score = x*B;
    y = sigmoid(score);
    
    y_hat = zeros(size(X,1),1);
    for i =1:size(X,1)
        if y(i)<=0.5
%             y_hat(i) = 1;
            y_hat(i) = 1;
        elseif y(i)>0.5
%             y_hat(i) = 2;
            y_hat(i) = 2;
        end
    end
    