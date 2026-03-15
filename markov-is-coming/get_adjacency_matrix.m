function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation
   % Extragere dimensiuni matrice
  n = rows(Labyrinth);
  m = columns(Labyrinth);
  max = n * m;
  % Crearea vectorilor de linie si coloana pentru matrice sparse
  rows = [];
  col = [];
  nr = 0;
  addWin = 0;
  addLose = 0;
	for i = 1 : n
    for j = 1 : m
      current = (i-1) * m + j; % Obtinerea pozitie curente 
      % SUS
      if (bitget(Labyrinth(i, j), 4) == 0)
        nr++;
        if (i == 1)
          rows(end + 1) = current;
          col(end + 1) = max + 1;
          addWin = 1;
        else
          rows(end + 1) = current;
          col(end + 1) = current - m;
        endif
      endif
      % JOS
      if (bitget(Labyrinth(i, j), 3) == 0)
        nr++;
        if (i == n)
          rows(end + 1) = current;
          col(end + 1) = max + 1;
          addWin = 1; 
        else
          rows(end + 1) = current;
          col(end + 1) = current + m;
        endif
      endif
      % DREAPTA
      if (bitget(Labyrinth(i, j), 2) == 0)
        nr++;
        if (j == m)
          rows(end + 1) = current;
          col(end + 1) = max + 2; 
          addLose = 1;
        else
          rows(end + 1) = current;
          col(end + 1) = current + 1;
        endif
      endif
      % STANGA
      if (bitget(Labyrinth(i, j), 1) == 0)
        nr++;
        if (j == 1)
          rows(end + 1) = current;
          col(end + 1) = max + 2;
          addLose = 1;
        else
          rows(end + 1) = current;
          col(end + 1) = current - 1;
        endif
      endif
    endfor
  endfor
  % Verificare in caz ca nu exista iesire catre WIN
  if (addWin == 1)
    rows(end + 1) = max + 1;
    col(end + 1) = max + 1;
  endif
  % Verificare in caz ca nu exista iesire catre LOSE
  if (addLose == 1)
    rows(end + 1) = max + 2;
    col(end + 1) = max + 2;
  endif
  nr += 2;
  vals = ones(1, nr);
  Adj = sparse(rows, col, vals, max + 2, max + 2);
end
