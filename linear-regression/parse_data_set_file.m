function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation
  fid = fopen(file_path, 'r');
   % Citirea dimensiunii matricei
   n = fscanf(fid, '%d', 1);
   m = fscanf(fid, '%d', 1);
   InitialMatrix = cell(n, m); % Creez matricea de celule
   Y = zeros(n);
   for i = 1 : n
     Y(i) = fscanf(fid, '%d', 1); 
     c = fscanf(fid, '%c', 1); % Citesc un caracter '  ' pentru a citi o linie intreaga dupa
     line = fgetl(fid); % Citesc o linie intreaga
     values = strsplit(line, ' ') % Separ valorile dupa spatiu
     for j = 1 : m
        InitialMatrix{i, j} = values{j}; % Atribui valorile la matrice
    endfor
   endfor
   fclose(fid);
end
