function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  % TODO: heuristic_greedy implementation
  n = rows(Adj);
  visited = zeros(1, n); % Crearea vectorului de aparitii pentru nodurile vizitate
  path(1) = start_position; % Adaug in path prima pozitie
  visited(start_position) = 1; % Adaug 'start_position' in 'visited'
  while (!isempty(path))
    position = path(end); % Extrag pozitia actuala
    if (position == n - 1)
      return;
    endif
    recalc = 1;
    while (recalc == 1 && !isempty(path)) % Repet pana gasesc un nod cu vecini nevizitati
      recalc = 0;
      position = path(end);
      pos_neigh = find(Adj(position, :) != 0);
      if (all(visited(pos_neigh)) == 1) % Verific daca toti vecinii posibili sunt vizitati
        path = path(1:end-1); % Scot pe 'position' din 'path'-ul final
        recalc = 1;
      endif
    endwhile
    unv_neigh = find(visited == 0); % Extrag toate nodurile care nevizitate 
    good_neigh = intersect(unv_neigh, pos_neigh);  % Intersectia dintre nodurile nevizitate si nodurile vecine posibile
    values = probabilities(good_neigh); % Extrag probabilitatile de a castiga la toti vecinii de care sunt interesat
    [maxim, idx] = max(values); % Extrag posibilitatea maxima, si la ce pozitie se afla valoarea nodului acelui vecin
    vecin = good_neigh(idx); % Iau valoarea nodului vecinului cel mai bun
    visited(vecin) = 1;
    path(end + 1) = vecin;
  endwhile
end
