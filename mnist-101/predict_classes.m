function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)

    theta1_end = hidden_layer_size * (input_layer_size + 1);
    Theta1 = reshape(weights(1:theta1_end), hidden_layer_size, input_layer_size + 1);
    Theta2 = reshape(weights(theta1_end+1:end), output_layer_size, hidden_layer_size + 1);

    m = size(X, 1);
    X = [ones(m,1) X];
    a2 = sigmoid(X * Theta1');
    a2 = [ones(m,1) a2];
    a3 = sigmoid(a2 * Theta2');

    [~, classes] = max(a3, [], 2);

end
