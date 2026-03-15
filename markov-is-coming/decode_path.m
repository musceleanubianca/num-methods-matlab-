function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation
	n = length(path); 
  	decoded_path = zeros(n-1, 2); % elimin WIN 
  	for i = 1:n-1
    	index = path(i);
    	decoded_path(i, 1) = floor((index - 1) / cols) + 1; 
    	decoded_path(i, 2) = mod((index - 1), cols) + 1;    
  	endfor
end
