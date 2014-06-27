function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%train the svm model
error = 1.0;
C_t = 0.01;
while C_t<=30,
   s_t = 0.01;
   while s_t <=30,
   model= svmTrain(X, y, C_t, @(x1, x2) gaussianKernel(x1, x2, s_t));
   predictions = svmPredict(model, Xval);
   e = mean(double(predictions ~= yval));
   if e<error,
       error = e;
       C=C_t;
       sigma = s_t;
   end;
   s_t = s_t*3;
   end;
   C_t = C_t*3;
end;







% =========================================================================

end
