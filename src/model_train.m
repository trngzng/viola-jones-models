load(fullfile('model.mat'));

positiveInstances = objectDetectorTrainingData(gTruth);

negativeImages = fullfile('../dataset/train-images/negative');

trainCascadeObjectDetector('model.xml', positiveInstances, ...
    negativeImages, 'FalseAlarmRate', 0.2, 'NumCascadeStages', 5);
