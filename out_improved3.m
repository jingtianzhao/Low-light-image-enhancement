function [L, R,noise,eIm] = out_improved3(src, alpha, beta, K, vareps,gamma,w1)
%% this function process three channel image
c=size(src,3);
L=zeros(size(src));
R=zeros(size(src));
noise=zeros(size(src));
src=im2double(src);
for i=1:c
    [L(:,:,i), R(:,:,i),noise(:,:,i)] = improved_algorithm3(src(:,:,i), alpha, beta, K, vareps,w1);
end


eIm=R.*L.^(1/gamma);

end

