function p = predict( test , P_word_spam , P_word_ham , P_w )

% index=find(test);
% extracted_test=test(index);

% convert to log
% extracted_P_word_spam=log(P_word_spam(index));
% extracted_P_word_ham=log(P_word_ham(index));
% p=[extracted_test.*extracted_P_word_spam;extracted_test.*extracted_P_word_ham];
p=[log(P_word_spam).*test;log(P_word_ham).*test];
p=sum(p,2)+log(P_w');
  

end

