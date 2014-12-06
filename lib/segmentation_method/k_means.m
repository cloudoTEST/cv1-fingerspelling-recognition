function [seg_pic] = k_means(pic)
    he = pic;
    %figure, imshow(he); %Na��tanie obr�zka
    cform = makecform('srgb2lab');
    lab_he = applycform(he,cform);
    %figure, imshow(lab_he);
    %Konvertovanie obr�zka do L*a*b* priestoru kv�li lep�iemu rozl�eniu dominantn�ch farieb (biela, modr�, ru�ov�)

    %Klasifik�cia farieb L*a*b modelu pomocou zhlukovania K-means
    ab = double(lab_he(:,:,2:3));
    nrows = size(ab,1);
    ncols = size(ab,2);
    ab = reshape(ab,nrows*ncols,2);
    nColors = 2;
    [cluster_idx,cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);

    %Rozdelenie pixlov obr�zka pod�a v�skedkov K-means
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    %figure, imshow(pixel_labels,[]), set(gca,'position',[0 0 1 1],'units','normalized')
    seg_pic = pixel_labels; %return result
end