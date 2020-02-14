function [data_filtered] = bilateral_local(data, local_window, sigma)
%BILATERAL_LOCAL Summary of this function goes here
%   Detailed explanation goes here
    Nx = size(data,2);
    h = fspecial('gaussian', local_window, 25);
    for i=1:Nx
        patch = reshape(data(:, i), local_window);
        [rows, cols] = find(patch == patch);
        rows = reshape(rows, local_window);
        cols = reshape(cols, local_window);
        Ncy = ceil(local_window(1)/2);
        Ncx = ceil(local_window(2)/2);
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        gamma = exp(-(dist)^2/(2*sigma*sigma));
        
        data_filtered(i) = sum(sum(dist .* gamma .* patch)) / sum(sum(dist .* gamma));
    end
end
