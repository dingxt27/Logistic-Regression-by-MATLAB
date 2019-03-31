function prediction = sigmoid(score)
    
    prediction = 1./(1+exp(-score));
end
