function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation
  [n, m] = size(InitialMatrix); % Obtinerea dimensiunii matricei
  nr = 1; % Numarul de coloane pe care matricea 'FeatureMatrix' le va avea
  for j = 1 : m
    % Extrag elementul din celula si incerc sa il fac un numar din string
    check = str2double(InitialMatrix{1, j});
    if (!isnan(check)) % Verific daca este numar
        % Transform toata coloane de numere sub forma de string-uri in numere
        FeatureMatrix(:, nr) = cellfun(@str2double, InitialMatrix(:, j), 'UniformOutput', false);
        nr++;
    else
      % NU este un numar, deci verific ce fel de string este
      if (strcmp(InitialMatrix{1, j}, 'yes') || strcmp(InitialMatrix{1, j}, 'no'))
        % Caz pentru coloana cu 'yes' si 'no'
        for i = 1 : n
          if (strcmp(InitialMatrix{i, j}, 'yes'))
            FeatureMatrix(i, nr) = 1;
          else
            FeatureMatrix(i, nr) = 0;
          endif
        endfor
        nr++;
      else
        % Caz pentru o coloana cu 'furnished', 'unfurnished' si 'semi-furnished'
        for i = 1 : n
          if (strcmp(InitialMatrix{i, j}, 'furnished'))
            FeatureMatrix(i, nr) = 0;
            FeatureMatrix(i, nr + 1) = 0;
          elseif (strcmp(InitialMatrix{i, j}, 'unfurnished'))
            FeatureMatrix(i, nr) = 0;
            FeatureMatrix(i, nr + 1) = 1;
          else
            FeatureMatrix(i, nr) = 1;
            FeatureMatrix(i, nr + 1) = 0;
          endif
        endfor
        nr = nr + 2;
      endif
    endif
  endfor
  FeatureMatrix = cell2mat(FeatureMatrix); % Transform matricea din una de tip celule in una normala
end
