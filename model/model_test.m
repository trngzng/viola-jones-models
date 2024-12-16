detector = vision.CascadeObjectDetector('model.xml');

positiveImageTestDir = fullfile('../dataset/test-images/positive');
negativeImageTestDir = fullfile('../dataset/test-images/negative');

outputTestDir = fullfile('../dataset/test-images/result-images');

positiveImageTest = imageDatastore(positiveImageTestDir);
negativeImageTest = imageDatastore(negativeImageTestDir);

testIndex = 1;

for i = 1: length(positiveImageTest.Files(:, 1))
    img = imread(string(positiveImageTest.Files(i,1)));
    
    bbox = step(detector, img);
    
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'No Turn Right Sign');
    
    name = fullfile(outputTestDir, sprintf("test%02d.jpg", testIndex));
    
    imwrite(detectedImg, name, "Quality", 100);

    testIndex = testIndex + 1;
end

for i = 1: length(negativeImageTest.Files(:, 1))
    img = imread(string(negativeImageTest.Files(i,1)));
    
    bbox = step(detector, img);
    
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'No Turn Right Sign');
    
    name = fullfile(outputTestDir, sprintf("test%02d.jpg", testIndex));
    
    imwrite(detectedImg, name, "Quality", 100);

    testIndex = testIndex + 1;
end

disp('Processing completed. Check the result-images folder for output images.');

