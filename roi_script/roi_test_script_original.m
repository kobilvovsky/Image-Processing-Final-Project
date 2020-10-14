folder_path = 'C:\Users\Kobi Lvovsky\Desktop\Project\test';
name = 'test9.jpg';

filename = append(folder_path, '\', name);
original = imread(fullfile(folder_path, name));

% grayscale the original image
grayImage = rgb2gray(original);

% transform greyscaled image to binary with 0.58 threshold(?)
binaryImage = imbinarize(grayImage, 0.5);
imshow(binaryImage);

% create ROI per image
roi = bwconvhull(binaryImage, 'objects'); %union
props = regionprops(roi); %Boundingbox

 %draw boxes on objects
for k = 1 : length(props) %s = find([props.Area] < 500);
   if props(k).Area > 2000 % ignore the outliers - only boxes of 1000+
       BB = props(k).BoundingBox;
       rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','y','LineWidth',1);
   end
end
 
%h = drawrectangle('Position',[props.BoundingBox(1),props.BoundingBox(2),props.BoundingBox(3),props.BoundingBox(4)],'StripeColor','r');

% add new row for ROI with the elements of the current flower
%roi_struct(i).imageFilename = filename;
%roi_struct(i).objectBoundingBoxes = [props.BoundingBox(1) props.BoundingBox(2) props.BoundingBox(3) props.BoundingBox(4)];
