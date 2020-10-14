addpath ('XML Files')
detector = vision.CascadeObjectDetector('flowerdetector_15_100.xml');
detector.MergeThreshold = 2;
detector.MinSize = [50 50];
img = imread('C:\Users\Kobi Lvovsky\Desktop\Project\test\test1.jpg');
bbox = step(detector,img);
detectedImg = insertObjectAnnotation(img,'rectangle', bbox, 'Flower', 'Color', 'red');
figure; imshow(detectedImg);