function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  ind_X = randperm(size(X, 1));
  ind_y = randperm(size(y, 1));
  rand_X = X(ind_X, :);
  rand_y = y(ind_y, :);
  n_X = rows(X);
  n_y = rows(y);
  new_n_X = percent * n_X;
  new_n_y = percent * n_y;
  X_train = X(1 : new_n_X, :);
  X_test = X(new_n_X + 1 : end, :);
  y_train = y(1 : new_n_y, :);
  y_test = y(new_n_y + 1 : end, :);
end
