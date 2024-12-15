% Đặt các đường dẫn đầu vào và đầu ra trong một mảng
imageDirs = {'../Dataset/train-images/positive', '../Dataset/train-images/negative',
    '../Dataset/test-images/positive', '../Dataset/test-images/negative'}; % Các thư mục đầu vào

for j = 1:length(imageDirs)
    imageFiles = dir(fullfile(imageDirs{j}, '.')); 
    validExtensions = {'.png', '.jpeg', '.bmp', '.tif', '.tiff', '.gif', '.jpg'}; 

    currentIndex = 1;
    
    for i = 1:length(imageFiles)
        [~, ~, ext] = fileparts(imageFiles(i).name);
    
        if ismember(lower(ext), validExtensions)
    
            imagePath = fullfile(imageDirs{j}, imageFiles(i).name);
            img = imread(imagePath);
    
            newFileName = sprintf('im%02d.png', currentIndex);
            outputPath = fullfile(imageDirs{j}, newFileName);
    
            imwrite(img, outputPath, 'png');
    
            currentIndex = currentIndex + 1;
        end
    end
end

clear