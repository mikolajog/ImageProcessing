function data_filtered = bilateral(data, local_window, sigma)
%CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here

%uchwyt do funkcji 'convolution_local'
FUNCTION = @(data_,local_window_)bilateral_local(data_,local_window_,sigma);

%przekazanie uchwytu FUNCTION do mechanizmu 'colfilt'
data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
end
