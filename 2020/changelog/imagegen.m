%% Original
rgb = imread('img-rgb.png');

subplot(4,2,1)
imshow(rgb)
title('original')

subplot(4,2,2)
imshow(rgb)
title('original')

unit = ones(size(rgb,1), size(rgb,2));
r = double(rgb(:,:,1)); 
g = double(rgb(:,:,2));
b = double(rgb(:,:,3));

%% 0.(r+g).b
subplot(4,2,3)
imshow(uint8(cat(3, 0*unit, min(255, r + g), b)))
title('0.(r+g).b - saturates, but version numbers dont')

%% 0.(r+g)/2.b
subplot(4,2,4)
imshow(uint8(cat(3, 0*unit, (r + g)/2, b)))
imwrite(uint8(cat(3, 0*unit, (r + g)/2, b)), 'img-0.r+g.b.jpeg')
title('0.(r+g)/2.b')

%% rg chromaticity
subplot(4,2,5)

tot = r+g+b;
imshow(cat(3, r./tot, g./tot, b./tot))
title('rgb chromaticity')

%% 0.rg chromaticity
subplot(4,2,6)

tot = r+g+b;
rg_averaged = 0.5*(r+g)./tot;

avg_green = mean(mean(mean(uint8(cat(3, 0*unit, (r + g)/2, b)))));
avg_rg = mean(mean(mean(cat(3, 0*unit, rg_averaged, b./tot))));
gain = avg_green/255/avg_rg;

imshow(cat(3, 0*unit, gain*rg_averaged, gain*b./tot))
imwrite(cat(3, 0*unit, gain*rg_averaged, gain*b./tot), 'img-0.rg-chromaticity.jpeg')
title('0.(rg-chromaticity).(b-chromaticity)')

%% intensity
subplot(4,2,7)
intensity_detail = 1; % dithering provides a lot of info
intensity_0_1 = (r+g+b)/3/255;
intensity_binned = round(intensity_detail * intensity_0_1)/intensity_detail;
imshow(cat(3, intensity_binned, intensity_binned, intensity_binned))
title('binned intensity')

%% intensity-modulated chromaticity
subplot(4,2,8)
imshow(cat(3, 0*unit, 3.*intensity_binned .* g./tot, 3.*intensity_binned .* b./tot))
imwrite(cat(3, 0*unit, 3.*intensity_binned .* g./tot, 3.*intensity_binned .* b./tot), 'img-rg-chromaticity-binned-intensity.jpeg')
title('rg-chromaticity binned intensity ')