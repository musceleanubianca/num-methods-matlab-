function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation
  n = columns(FeatureMatrix);
  square = 1;
  % Calculez valorile proprii ale matricei 'FeatureMatrix'
  if (size(FeatureMatrix, 1) == size(FeatureMatrix, 2))
    [V, D] = eig(FeatureMatrix);
  else
    A = FeatureMatrix' * FeatureMatrix;
    [V, D] = eig(A);
    square = 0;
  endif
  if all(D(:) >= 0)
    % Caz cu valori proprii pozitive
    Theta = zeros(n, 1);
    if (square == 1)
      % Caz cu matrice patratica
      r_old = Y - FeatureMatrix * Theta;
      v = r_old;
      tol_sq = tol * tol;
      k = 1;
      while (k <= iter && r_old' * r_old > tol_sq)
        t = (r_old' * r_old) / (v' * FeatureMatrix * v);
        Theta = Theta + t * v;
        r = r_old - t * FeatureMatrix * v;
        s = (r' * r) / (r_old' * r_old);
        v = r + s * v;
        k++;
        r_old = r;
      endwhile
    else
      % Caz cu matrice nepatratica
      B = inv(A);
      Theta = B * FeatureMatrix' * Y;
    endif
  else
    Theta = zeros(n, 1);
  endif
  Theta = vertcat(0, Theta); %Adaug o linie de zerouri la inceput
end
