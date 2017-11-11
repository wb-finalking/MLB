%ham_train contains the occurrences of each word in ham emails. 1-by-N vector
ham_train = csvread('ham_train.csv');
%spam_train contains the occurrences of each word in spam emails. 1-by-N vector
spam_train = csvread('spam_train.csv');
%N is the size of vocabulary.
N = size(ham_train, 2);
%There 9034 ham emails and 3372 spam emails in the training samples
num_ham_train = 9034;
num_spam_train = 3372;
%Do smoothing
x = [ham_train;spam_train] + 1;

%ham_test contains the occurences of each word in each ham test email. P-by-N vector, with P is number of ham test emails.
load ham_test.txt;
ham_test_tight = spconvert(ham_test);
ham_test = sparse(size(ham_test_tight, 1), size(ham_train, 2));
ham_test(:, 1:size(ham_test_tight, 2)) = ham_test_tight;
%spam_test contains the occurences of each word in each spam test email. Q-by-N vector, with Q is number of spam test emails.
load spam_test.txt;
spam_test_tight = spconvert(spam_test);
spam_test = sparse(size(spam_test_tight, 1), size(spam_train, 2));
spam_test(:, 1:size(spam_test_tight, 2)) = spam_test_tight;

%TODO
%Implement a ham/spam email classifier, and calculate the accuracy of your classifier

%%%%%%%%%%%%%%     classifier        %%%%%%%%%

%  P(X|spam) or P(X|ham)
P_word_ham = x(1,:)./repmat(sum(x(1,:),2),1,N);
P_word_spam = x(2,:)./repmat(sum(x(2,:),2),1,N);

%  P(spam) or P(ham)
P_w=num_spam_train/(num_spam_train+num_ham_train);
P_w=[P_w,1-P_w];

%  P(w|X)
num_spam=size(spam_test,1);
P_spam_test=zeros(2,num_spam);
for i=1: num_spam
    P_spam_test(:,i) = predict(spam_test(i,:),P_word_spam,P_word_ham,P_w);
end
num_ham=size(ham_test,1);
P_ham_test=zeros(2,num_ham);
for i=1: num_ham
    P_ham_test(:,i) = predict(ham_test(i,:),P_word_spam,P_word_ham,P_w);
end

%%%%%%%%%%    accuracy   %%%%%%%%%%

% |              |Spam(label) | Ham(label)|
% |--------------|------------|-----------|
% |Spam(predict) |     TP     |    FP     |
% |Ham(predict)  |     FN     |    TN     |

tp = sum(P_spam_test(1,:)>P_spam_test(2,:));
fp = num_spam-tp;
fn = sum(P_ham_test(1,:)>P_ham_test(2,:));
tn = num_ham-fn;
%%%%%%%%%%  precision=tp/(tp+fp)  %%%%%%%%%

precision=tp/(tp+fp);

%%%%%%%%%%    recall=tp/(tp+fn)   %%%%%%%%%

recall=tp/(tp+fn);