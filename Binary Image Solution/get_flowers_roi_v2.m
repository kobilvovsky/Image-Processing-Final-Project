%function get_flowers_roi(threshold)

    % count positive images
    folder_path = 'C:\Users\Kobi Lvovsky\Desktop\Project\Positive';
    images = dir(fullfile(folder_path,'\*.jpg*'));
    size = numel(images);

    roi_struct = struct; %number of elements
    j = 1;

    % for each image
    for i = 1:size
        filename = append(folder_path, '\', images(i).name);
        original = imread(fullfile(folder_path, images(i).name));

        % grayscale the original image
        grayImage = rgb2gray(original);

        % transform greyscaled image to binary with 0.6 threshold(?)
        binaryImage = imbinarize(grayImage, 0.7);

        % create ROI per image
        roi = bwconvhull(binaryImage, 'objects');
        props = regionprops(roi);
        
        for k = 1:length(props) %s = find([props.Area] < 500);
           if props(k).Area > 2000 % ignore the outliers - only boxes of 2000+
               % add new row for ROI with the elements of the current flower
               
               j = j + 1;
               BB = props(k).BoundingBox;
               roi_struct(j).imageFilename = filename;
               roi_struct(j).objectBoundingBoxes = [BB(1),BB(2),BB(3),BB(4)];
           end
        end
    end