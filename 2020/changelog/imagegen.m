%% The raw image
rgb = imread('lena-rgb.png');
%figure('Name', 'Original')
%imshow(rgb)
%figure('Name', 'Smashed')

unit = ones(size(rgb,1), size(rgb,2));
r = double(rgb(:,:,1)); 
g = double(rgb(:,:,2));
b = double(rgb(:,:,3));

num_attempts = 5;

%% 0.(r+g).b
subplot(2,num_attempts,1)
imshow(uint8(cat(3, 0*unit, min(255, r + g), b)))
title('0.(r+g).b')

%% 0.(r+g)/2.b
subplot(2,num_attempts,2)
imshow(uint8(cat(3, 0*unit, (r + g)/2, b)))
title('0.(r+g)/2.b')

%% YCbCr
y = limitRound(            0.299   *r + 0.587   *g + 0.114   *b);
cb = limitRound(128*unit - 0.168736*r - 0.331264*g + 0.5     *b);
cr = limitRound(128*unit + 0.5     *r - 0.418688*g - 0.081312*b);

subplot(2,num_attempts,num_attempts+1)
imshow(fromYCbCr(cat(3, 0*unit, y+cb, cr)))
title('0.(Y+Cb).Cr')

subplot(2,num_attempts,num_attempts+2)
imshow(fromYCbCr(cat(3, 0*unit, 0.5*(y+cb), cr)))
title('0.(Y+Cb)/2.Cr')

%% Rescaled only as necessary (RGB)
subplot(2,num_attempts, 3)

smashed_rg_norm = (r+g) * (255/max(max(r+g)));
imshow(uint8(cat(3, 0*unit, smashed_rg_norm, b)))
imwrite(uint8(cat(3, 0*unit, smashed_rg_norm, b)), 'lena-0.r+g.b.jpeg')
title('0.(r+g)^N.b')

%% Rescaled only as necessary (YCbCr)
subplot(2,num_attempts,num_attempts+3)

y_  = double(y);
cb_ = double(cb);

smashed_ycb_norm = (y_+cb_) * (255/max(max(y_+cb_)));
imshow(fromYCbCr(cat(3, 0*unit, smashed_ycb_norm, cr)))
title('0.(Y+Cb)^N.Cr')

%% Rescaled all channels (RGB)
subplot(2,num_attempts,4)

scale_rg = 255/max(max(r+g));
imshow(uint8(cat(3, 0*unit, scale_rg*(r+g), scale_rg*b)))
title('(0.r+g.b)^N')

%% Rescaled all channels (YCbCr)
subplot(2,num_attempts,num_attempts+4)

y_  = double(y);
cb_ = double(cb);
scale_ycb = 255/max(max(y_+cb_));

imshow(fromYCbCr(cat(3,0*unit, scale_ycb*(y_+cb_), scale_ycb*cr)))
title('(0.Y+Cb.Cr)^N')

%% rg chromaticity
tot = r+g+b;
subplot(2,num_attempts,5)
imshow(cat(3, r./tot, g./tot, b./tot))
title('rg chromaticity')

subplot(2,num_attempts,num_attempts+5)
rg_averaged = 0.5*(r+g)./tot;
imshow(cat(3, 0*unit, rg_averaged, b./tot))
imwrite(cat(3, 0*unit, rg_averaged, b./tot), 'lena-0.rg-chromaticity.jpeg')
title('0.rg chromaticity')


%% Math
function out = limitRound(in)
    out = uint8(max(0, min(255, round(in))));
end

function out = fromYCbCr(ycbcr)
    y  = double(ycbcr(:,:,1));
    cb = double(ycbcr(:,:,2));
    cr = double(ycbcr(:,:,3));
    unit = ones(size(ycbcr,1), size(ycbcr,2));
    r = limitRound(y + 1.402  *(cr - 128*unit));
    g = limitRound(y - 0.34414*(cb - 128*unit) - 0.71414*(cr - 128*unit));
	b = limitRound(y + 1.772  *(cb - 128*unit));
	out = cat(3, r, g, b);
end
