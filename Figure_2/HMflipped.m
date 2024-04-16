% Replace with the actual path to your folder
vidPath="C:\Users\Vincent\Videos\Day2TailhalfkappaT2\2023_11_16-09_09_35\results\ShockThreat\InfoFolder\Videos\ExAn11_2.mp4"
folderPath="C:\Users\Vincent\Videos\Day2Bodyhalfkappa\2023_11_15-18_31_34\results\AllThreat"

% Create a VideoReader object
videoObj = VideoReader(vidPath);

% Read in a frame from the video
frame = read(videoObj, 100);  % Adjust the frame number as needed


% Get a list of all CSV files in the folder
csvFiles = dir(fullfile(folderPath, '*.csv'));

% Specify the lists
Left = {'ExAn7', 'ExAn8', 'ExAn12', 'ExAn13', 'ExAn14', 'ExAn15', 'ExAn17', 'ExAn21', 'ExAn25'};
Right = {'ExAn9', 'ExAn10', 'ExAn11', 'ExAn16', 'ExAn18', 'ExAn19', 'ExAn20', 'ExAn22', 'ExAn23', 'ExAn24', 'ExAn26', 'ExAn28'};
Shocked = {'ExAn7', 'ExAn8', 'ExAn11', 'ExAn12', 'ExAn15', 'ExAn16', 'ExAn19', 'ExAn20', 'ExAn24', 'ExAn25', 'ExAn28'};
NonShocked = {'ExAn9', 'ExAn10', 'ExAn13', 'ExAn14', 'ExAn17', 'ExAn18', 'ExAn22', 'ExAn26'};

% Initialize cell arrays to store filtered rows for Left and Right
filteredRowsLeftShocked = cell(1, numel(Left));
filteredRowsRightShocked = cell(1, numel(Right));
filteredRowsLeftNonShocked = cell(1, numel(Left));
filteredRowsRightNonShocked = cell(1, numel(Right));

% Iterate through each CSV file
for fileIndex = 1:numel(csvFiles)
    % Extract the file name without extension
    fileName = csvFiles(fileIndex).name;
    
    % Read the CSV file
    data = readtable(fullfile(folderPath, fileName));
    
    % Add a new column with the corresponding string
    data.StringFound = repmat("", size(data, 1), 1);
    
    % Check if the file name contains a string from the Left list
    leftString = contains(fileName, Left);
    if any(leftString)
        % Find the corresponding string
        foundString = Left{leftString};
        
        % Set the new column values
        data.StringFound(:) = foundString;
        
        % Check if the mouse is shocked or not
        if any(strcmp(foundString, Shocked))
            % Store in the cell array for shocked left mice
            filteredRowsLeftShocked{end + 1} = data;
        elseif any(strcmp(foundString, NonShocked))
            % Store in the cell array for non-shocked left mice
            filteredRowsLeftNonShocked{end + 1} = data;
        end
    end
    
    % Check if the file name contains a string from the Right list
    rightString = contains(fileName, Right);
    if any(rightString)
        % Find the corresponding string
        foundString = Right{rightString};
        
        % Set the new column values
        data.StringFound(:) = foundString;
        
        % Check if the mouse is shocked or not
        if any(strcmp(foundString, Shocked))
            % Store in the cell array for shocked right mice
            filteredRowsRightShocked{end + 1} = data;
        elseif any(strcmp(foundString, NonShocked))
            % Store in the cell array for non-shocked right mice
            filteredRowsRightNonShocked{end + 1} = data;
        end
    end
end

% Remove empty cells
filteredRowsLeftShocked = filteredRowsLeftShocked(~cellfun('isempty', filteredRowsLeftShocked));
filteredRowsRightShocked = filteredRowsRightShocked(~cellfun('isempty', filteredRowsRightShocked));
filteredRowsLeftNonShocked = filteredRowsLeftNonShocked(~cellfun('isempty', filteredRowsLeftNonShocked));
filteredRowsRightNonShocked = filteredRowsRightNonShocked(~cellfun('isempty', filteredRowsRightNonShocked));

% Display or do further processing with filteredRowsLeftShocked, filteredRowsRightShocked,
% filteredRowsLeftNonShocked, and filteredRowsRightNonShocked

% Initialize a cell array to store the modified subcells for shocked mice
modifiedSubcellsShocked = cell(size(filteredRowsRightShocked));

% Loop through each subcell in filteredRowsRightShocked
for i = 1:numel(filteredRowsRightShocked)
    % Copy the current subcell to preserve other elements
    modifiedSubcell = filteredRowsRightShocked{i};

    % Extract coordinates from the current subcell
    coordinates = table2array(modifiedSubcell(:, 2:3));

    % Find the maximum x and y values from the frame (assuming you have a frame variable)
    maxX = size(frame, 2);
    maxY = size(frame, 1);

    % Flip the coordinates on the vertical axis
    flippedCoordinates = coordinates;
    flippedCoordinates(:, 1) = maxX - coordinates(:, 1);

    % Update the coordinates in the modified subcell
    modifiedSubcell(:, 2:3) = array2table(flippedCoordinates, 'VariableNames', {'X', 'Y'});

    % Store the modified subcell in the cell array
    modifiedSubcellsShocked{i} = modifiedSubcell;
end

% Display or use modifiedSubcellsShocked as needed

% Initialize a cell array to store the modified subcells for non-shocked mice
modifiedSubcellsNonShocked = cell(size(filteredRowsRightNonShocked));

% Loop through each subcell in filteredRowsRightNonShocked
for i = 1:numel(filteredRowsRightNonShocked)
    % Copy the current subcell to preserve other elements
    modifiedSubcell = filteredRowsRightNonShocked{i};

    % Extract coordinates from the current subcell
    coordinates = table2array(modifiedSubcell(:, 2:3));

    % Find the maximum x and y values from the frame (assuming you have a frame variable)
    maxX = size(frame, 2);
    maxY = size(frame, 1);

    % Flip the coordinates on the vertical axis
    flippedCoordinates = coordinates;
    flippedCoordinates(:, 1) = maxX - coordinates(:, 1);

    % Update the coordinates in the modified subcell
    modifiedSubcell(:, 2:3) = array2table(flippedCoordinates, 'VariableNames', {'X', 'Y'});

    % Store the modified subcell in the cell array
    modifiedSubcellsNonShocked{i} = modifiedSubcell;
end

% Display or use modifiedSubcellsNonShocked as needed

% Reconstruct arrays for shocked and non-shocked mice
ReconstructedArraysShock = cat(2, filteredRowsLeftShocked, modifiedSubcellsShocked);
ReconstructedArraysNonShock = cat(2, filteredRowsLeftNonShocked, modifiedSubcellsNonShocked);

% Display or use ReconstructedArraysShock and ReconstructedArraysNonShock as needed
yourCellArray=ReconstructedArraysShock;
% Specify the numbers to check
numbersToCheck = [0,1,5,15];  % Replace with your relevant numbers

% Initialize a cell array to store filtered tables for each number
filteredTablesByNumber = cell(1, numel(numbersToCheck));

% Iterate through each subcell in the cell array
for cellIndex = 1:numel(yourCellArray)
    % Extract the table from the current subcell
    currentTable = yourCellArray{cellIndex};
    
    % Iterate through each number of interest
    for numIndex = 1:numel(numbersToCheck)
        % Find rows where the first column matches the current number
        rowsWithNumber = currentTable(currentTable.syllable == numbersToCheck(numIndex), :);
        
        % Store the filtered rows for this number and table
        filteredTablesByNumber{numIndex} = [filteredTablesByNumber{numIndex}; rowsWithNumber];
    end
end



% Save the filtered rows for each number into separate CSV files
for numIndex = 1:numel(numbersToCheck)
    if ~isempty(filteredTablesByNumber{numIndex})
        % Construct the file name based on the number
        fileName = sprintf('%dS.csv', numbersToCheck(numIndex));
        
        % Write the table to a CSV file
        writetable(filteredTablesByNumber{numIndex}, fileName);
        
        fprintf('File saved: %s\n', fileName);
    end
end



% Display or use ReconstructedArraysShock and ReconstructedArraysNonShock as needed
yourCellArray=ReconstructedArraysNonShock;
% Specify the numbers to check
numbersToCheck = [0,1,5,15];  % Replace with your relevant numbers

% Initialize a cell array to store filtered tables for each number
filteredTablesByNumber = cell(1, numel(numbersToCheck));

% Iterate through each subcell in the cell array
for cellIndex = 1:numel(yourCellArray)
    % Extract the table from the current subcell
    currentTable = yourCellArray{cellIndex};
    
    % Iterate through each number of interest
    for numIndex = 1:numel(numbersToCheck)
        % Find rows where the first column matches the current number
        rowsWithNumber = currentTable(currentTable.syllable == numbersToCheck(numIndex), :);
        
        % Store the filtered rows for this number and table
        filteredTablesByNumber{numIndex} = [filteredTablesByNumber{numIndex}; rowsWithNumber];
    end
end



% Save the filtered rows for each number into separate CSV files
for numIndex = 1:numel(numbersToCheck)
    if ~isempty(filteredTablesByNumber{numIndex})
        % Construct the file name based on the number
        fileName = sprintf('%dNS.csv', numbersToCheck(numIndex));
        
        % Write the table to a CSV file
        writetable(filteredTablesByNumber{numIndex}, fileName);
        
        fprintf('File saved: %s\n', fileName);
    end
end




