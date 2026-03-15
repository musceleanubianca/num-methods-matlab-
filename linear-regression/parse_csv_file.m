function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation
  fid = fopen(file_path, 'r');
  sir_str = repmat('%s', [1 13]); % Vector de 13 elemente de tip str
  % Citesc in 'Read_Matrix' tot fisierul fara linia 1, elementele fiind despartite prin virgula
  Read_Matrix = textscan(fid, sir_str, 'Delimiter', ',', 'HeaderLines', 1);
  Y = Read_Matrix{1}; % Extrag prima coloana
  Y = cellfun(@str2double, Y, 'UniformOutput', false); % Transform toate elementele din string in numere
  Y = vertcat(Y{:}); % Concatenez coloanele intr-o singura coloana
  n = size(Y, 1);
  InitialMatrix = cell(n, 12); % Creez matrice de celule
  for i = 1 : 12
    for j = 1 : n
      InitialMatrix{j, i} = Read_Matrix{1, i+1}{j, 1};
    endfor 
  endfor
  fclose(fid);
end
