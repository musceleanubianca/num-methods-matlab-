function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  Theta = zeros(n, 1); % La prima iteratie Theta contine doar zerouri
   for k = 1 : iter
     P = FeatureMatrix * Theta;
     S = P - Y;
     Grad = (1 / m) * FeatureMatrix' * S;
     Theta = Theta - alpha * Grad;
   endfor
   Theta = vertcat(0, Theta); %Adaug o linie de zerouri la inceput
end
