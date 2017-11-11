% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%%load data
load('data');
all_x = cat(2, x1_train, x1_test, x2_train, x2_test);
range = [min(all_x), max(all_x)];
train_x = get_x_distribution(x1_train, x2_train, range);
test_x = get_x_distribution(x1_test, x2_test, range);

%% Part1 likelihood: 
l = likelihood(train_x);

bar(range(1):range(2), l');
xlabel('x');
ylabel('P(x|\omega)');
axis([range(1) - 1, range(2) + 1, 0, 0.5]);

%TODO
%compute the number of all the misclassified x using maximum likelihood decision rule
disp('........the number of all the misclassified x using maximum likelihood decision rule')
ml_classifier=l(1,:)>l(2,:);
num_misclassified_ML=sum(ml_classifier(x2_test+7))+size(x1_test,2)-sum(ml_classifier(x1_test+7))
%% Part2 posterior:
p = posterior(train_x);

bar(range(1):range(2), p');
xlabel('x');
ylabel('P(\omega|x)');
axis([range(1) - 1, range(2) + 1, 0, 1.2]);

%TODO
%compute the number of all the misclassified x using optimal bayes decision rule
disp('........the number of all the misclassified x using optimal bayes decision rule')
bd_classifier=p(1,:)>p(2,:);
num_misclassified_BD=sum(bd_classifier(x2_test+7))+size(x1_test,2)-sum(bd_classifier(x1_test+7))
%% Part3 risk:
risk = [0, 1; 2, 0];
%TODO
%get the minimal risk using optimal bayes decision rule and risk weights
R_alpah=risk*p;
risk_bd_classifier=R_alpah(1,:)>R_alpah(2,:);
num_misclassified_risk_BD=sum(risk_bd_classifier(x2_test+7))+size(x1_test,2)-sum(risk_bd_classifier(x1_test+7))