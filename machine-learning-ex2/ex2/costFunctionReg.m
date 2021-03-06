function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
modifiedT = theta(2:end);
J = (1/m)*sum(-y'*log(sigmoid(X*theta))-(1-y')*log(1-sigmoid(X*theta))) + (lambda/(2*m))*sum(modifiedT.^2);
hypo = sigmoid(X*theta);

for (j = 1:size(theta))
    for(i = 1:m)
        grad(j) = grad(j) + (hypo(i) - y(i))*X(i,j);
    endfor
    if(j==1)
      grad(j) = (1/m)*grad(j);
    else
      grad(j) = (1/m)*grad(j) + (lambda/m)*theta(j);
    endif
endfor





% =============================================================

end
