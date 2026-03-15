function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
  n = rows(Labyrinth);
  m = columns(Labyrinth);
  % Pentru a crea deja adiacentele sa simplific crearea matricei Link
  Link = get_adjacency_matrix(Labyrinth);
  for i = 1 : n * m + 2
    s = sum(Link(i, :));
    proc = 1/s;
    idx = Link(i, :) != 0; % Extrag indicii de linii ai caror elemente sunt 1
    Link(i, idx) = proc;
  endfor
end
