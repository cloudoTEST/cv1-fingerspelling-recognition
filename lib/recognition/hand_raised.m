function raised_hand = hand_raised( seg_img )
    %Checks whether hand is raised
    % figure; imshow(seg_img);
    height = size(seg_img, 1);
    width = size(seg_img, 2);
    
     if width/height > 0.57
        raised_hand = 0
     else
         raised_hand = 1
     end
end

