positive_ins = roi_struct; % pos_roi
pos_dir = fullfile('C:\Users\Kobi Lvovsky\Desktop\Project\Positive');
addpath(pos_dir);
neg_dir = fullfile('C:\Users\Kobi Lvovsky\Desktop\Project\Negative');

trainCascadeObjectDetector('flowerdetector_alg70_15_100.xml', positive_ins, neg_dir,...
    'NumCascadeStages', 15, 'FalseAlarmRate', 0.1);
