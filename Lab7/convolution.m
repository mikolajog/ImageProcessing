function data_filtered = convolution(data,local_window)
%CONVOLUTION Summary of this function goes here
%   Detailed explanation goes here

%uchwyt do funkcji 'convolution_local'
FUNCTION = @(data_,local_window_)convolution_local(data_,local_window_);

%przekazanie uchwytu FUNCTION do mechanizmu 'colfilt'
data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
end

