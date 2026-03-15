function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  m = rows(FeatureMatrix);
  Theta = Theta(2:end, :); % Sterg linia cu zerouri pt Theta0
  P = FeatureMatrix * Theta;
  S = (P - Y) .* (P - Y);
  Error = sum(S)/(2 * m);
end
