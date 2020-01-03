%% The raw image
rgb = imread('lena-rgb.png');
figure('Name', 'Original')
imshow(rgb)
unit = ones(size(rgb,1), size(rgb,2));

figure('Name', 'Smashed')

%% 0.(r+g).b
smashed_0_rg_b = cat(3, 0.*unit, rgb(:,:,1) + rgb(:,:,2), rgb(:,:,3));
subplot(2,2,1)
imshow(smashed_0_rg_b)
title('0.(r+g).b')


%% 0.(r+g)/2.b
smashed_0_rg2_b = cat(3, 0.*unit, 0.5.*(rgb(:,:,1) + rgb(:,:,2)), rgb(:,:,3));
subplot(2,2,2)
imshow(smashed_0_rg2_b)
title('0.(r+g)/2.b')

%% YCbCr
r = double(rgb(:,:,1));
g = double(rgb(:,:,2));
b = double(rgb(:,:,3));
unit = ones(size(rgb,1), size(rgb,2));
y = limitRound(            0.299   .*r + 0.587   .*g + 0.114   .*b);
cb = limitRound(128*unit - 0.168736.*r - 0.331264.*g + 0.5     .*b);
cr = limitRound(128*unit + 0.5     .*r - 0.418688.*g - 0.081312.*b);

subplot(2,2,3)
imshow(fromYCbCr(cat(3, 0*unit, y+cb, cr)))
title('0.(Y+Cb).Cr')

subplot(2,2,4)
imshow(fromYCbCr(cat(3, 0*unit, 0.5.*(y+cb), cr)))
title('0.(Y+Cb)/2.Cr')

%% Math
function out = limitRound(in)
    out = uint8(max(0, min(255, round(in))));
end

function out = fromYCbCr(ycbcr)
    y  = double(ycbcr(:,:,1));
    cb = double(ycbcr(:,:,2));
    cr = double(ycbcr(:,:,3));
    unit = ones(size(ycbcr,1), size(ycbcr,2));
    r = limitRound(y + 1.402.*(cr - 128*unit));
    g = limitRound(y - 0.34414.*(cb - 128*unit) - 0.71414.*(cr - 128*unit));
	b = limitRound(y + 1.772.* (cb - 128*unit));
	out = cat(3, r, g, b);
end
