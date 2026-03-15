# num-methods-matlab-
MATLAB/Octave implementations of Markov chains, linear regression, and MNIST digit classification with logistic regression and a neural network.

## Modules

### 1. Markov Chains — Maze Solver (`markov-is-coming/`)
Models a robot navigating a maze using Markov chain probability theory.
Each maze cell is a state, and transitions are determined by accessible 
neighbors. Solves a linear equation system derived from the transition 
matrix to estimate the probability of reaching the exit.

### 2. Linear Regression (`linear-regression/`)
Implements multiple linear regression for predicting apartment prices 
from a CSV dataset. Includes both gradient descent and normal equation 
solutions, with Lasso and Ridge regularization to reduce overfitting.

### 3. MNIST Digit Classification (`mnist-101/`)
Implements a neural network for handwritten digit recognition on the 
MNIST dataset. Architecture: 400 input units (20×20 pixel images), 
25 hidden units, 10 output classes (digits 0–9). Uses sigmoid activation, 
backpropagation, and gradient descent with regularization.

## How to Run
1. Open MATLAB or Octave
2. Navigate to the module folder you want to run
3. Call the relevant function, for example:
```matlab
% Markov chains
Labyrinth = parse_labyrinth('input.txt');

% Linear regression
[Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter);

% MNIST
[predictions] = predict_classes(Theta1, Theta2, X);
```

## Tech Stack
MATLAB/Octave

## Project Structure
├── markov-is-coming/     # Markov chain maze probability solver
│   ├── parse_labyrinth.m
│   ├── get_adjacency_matrix.m
│   ├── get_link_matrix.m
│   ├── perform_iterative.m
│   └── ...
├── linear-regression/    # Multiple linear regression with regularization
│   ├── gradient_descent.m
│   ├── normal_equation.m
│   ├── parse_csv_file.m
│   └── ...
└── mnist-101/            # Neural network for digit classification
    ├── sigmoid.m
    ├── cost_function.m
    ├── predict_classes.m
    └── ...
