function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  % TODO: initialize_weights implementation
  eps = sqrt(6) / sqrt(L_next + L_prev);
  matrix = rand(L_next, L_prev + 1); % Creez o matrice cu valori aleatoare intre 0 si 1
  % Duc valorile din (0, 1) in (-eps, eps);
  matrix = matrix .* (eps * 2);
  matrix = matrix .- eps;
end
