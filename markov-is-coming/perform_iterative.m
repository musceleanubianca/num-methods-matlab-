function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
	doit = 1; % Timpul in care se calculeaza urmatoarea iteratie
  	steps = 0;
 	 x = x0;
  	while (steps < max_steps && doit == 1)
    	s = G * x0;
   		x = c + s;
    	temp = x - x0;
    	err = norm(temp);
    	if (err < tol)
        	doit = 0;
    	endif
    	x0 = x;
    	steps++;
  	endwhile 
end
