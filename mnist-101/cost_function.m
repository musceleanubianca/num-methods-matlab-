function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)

    theta1_end = hidden_layer_size * (input_layer_size + 1);
    Theta1 = reshape(params(1:theta1_end), hidden_layer_size, input_layer_size + 1);
    Theta2 = reshape(params(theta1_end+1:end), output_layer_size, hidden_layer_size + 1);

    m = size(X, 1);

    X = [ones(m, 1) X]; 
    z2 = X * Theta1';
    a2 = sigmoid(z2);
    a2 = [ones(m,1) a2]; 
    z3 = a2 * Theta2';
    a3 = sigmoid(z3); 

    y_matrix = eye(output_layer_size)(y,:);

    cost = sum(sum(-y_matrix .* log(a3) - (1 - y_matrix) .* log(1 - a3)));
    J = cost / m + lambda / (2*m) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

    delta3 = a3 - y_matrix;
    delta2 = (delta3 * Theta2)(:,2:end) .* sigmoidGradient(z2);

    Delta1 = delta2' * X;
    Delta2 = delta3' * a2;

    Theta1_grad = Delta1 / m;
    Theta2_grad = Delta2 / m;
    Theta1_grad(:,2:end) += lambda/m * Theta1(:,2:end);
    Theta2_grad(:,2:end) += lambda/m * Theta2(:,2:end);

    grad = [Theta1_grad(:); Theta2_grad(:)];

end
