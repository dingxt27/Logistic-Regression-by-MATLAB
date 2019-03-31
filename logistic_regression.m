clc
clear all;

data = dlmread('crabdata.txt');
% data = dlmread('data_banknote_authentication.txt');


% data_norm = zeros(size(data,1),size(data,2));
% for k =1:size(data,2)
%     data_norm(:,k) = (data(:,k)-mean(data(:,k)))./std(data(:,k));
% end

num = size(data,1)*0.75;
k = randperm(size(data,1),num);
a = (1:size(data,1));
u = setdiff(a,k);

train = zeros(num,size(data,2));
test = zeros(size(data,1)-num,size(data,2));

for i = 1: num
%     train(i,:) = data_norm(k(i),:);
    train_old(i,:) = data(k(i),:);
end

for j = 1:size(test,1)
%     test(j,:) = data_norm(u(j),:);
    test_old(j,:) = data(u(j),:);
end

train_t = train_old(:,1);
train_t_new = train_t - 1;
test_t = test_old(:,1);

[B,cost,y,x,Y] = getB(train_old,100000,0.0001,train_t_new);

% plot(1:10000,cost)

y_train = testB(B,train_old);
y_test = testB(B,test_old);

%accuracy
accuracy_train = sum(y_train == train_t)/length(train_t);
accuracy_test = sum(y_test == test_t)/length(test_t);
C_train = confusionmat(train_t,y_train);
C_test = confusionmat(test_t,y_test);

% B_matlab = mnrfit(train_old(:,4:8),train_old(:,1))


