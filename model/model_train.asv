load(fullfile('model.mat'));

positiveInstances = objectDetectorTrainingData(gTruth);

negativeImages = fullfile('../ataset/train-images/negative');

trainCascadeObjectDetector('model.xml', positiveInstances, ...
    negativeImages, 'FalseAlarmRate', 0.01, 'NumCascadeStages', 5);
