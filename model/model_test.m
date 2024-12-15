detector = vision.CascadeObjectDetector('model.xml');

dir_test = fullfile('../dataset/test-images/positive');

dir_save = fullfile('../dataset/test-images/ResultImage');

image_test = imageDatastore(dir_test);
image_test_name = image_test.Files(:,1);

nfiles = length(image_test_name);

for ii = 1:nfiles
    img = imread(string(image_test_name(ii,1)));
    
    bbox = step(detector, img);
    
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'Sign');
    
    name = fullfile(dir_save, sprintf("test_%d.jpg", ii));
    
    imwrite(detectedImg, name, "Quality", 100);
end

disp('Processing completed. Check the result folder for output images.');

