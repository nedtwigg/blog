%% Original
rgb = imread('img-rgb.png'); % parrots http://r0k.us/graphics/kodak/kodim23.html

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

fix = @(x) fillmissing(x, 'constant', 0);

tot = r+g+b;
imshow(fix(cat(3, r./tot, g./tot, b./tot)))
title('rgb chromaticity')

%% 0.rg chromaticity
subplot(4,2,6)

rg_averaged = fix(0.5*(r+g)./tot);
bg_chrom = fix(cat(3, 0*unit, rg_averaged, b./tot));

avg_green = mean(mean(mean(uint8(cat(3, 0*unit, (r + g)/2, b)))));
avg_rg = mean(mean(mean(rg_averaged)));
gain = avg_rg/(avg_green/255); 

imshow(gain * bg_chrom)
imwrite(gain * bg_chrom, 'img-0.rg-chromaticity.jpeg')
title('0.(rg-chromaticity).(b-chromaticity)')

%% intensity
subplot(4,2,7)
intensity_detail = 3; % 0.x, 1.x, 2.x, 3.x
intensity_0_1 = (r+g+b)/3/255;
intensity_binned = round(intensity_detail * intensity_0_1)/intensity_detail;
imshow(cat(3, intensity_binned, intensity_binned, intensity_binned))
title('binned intensity')

%% intensity-modulated chromaticity
subplot(4,2,8)
imshow(fix(cat(3, 0*unit, 3.*intensity_binned .* g./tot, 3.*intensity_binned .* b./tot)))
imwrite(fix(cat(3, 0*unit, 3.*intensity_binned .* g./tot, 3.*intensity_binned .* b./tot)), 'img-rg-chromaticity-binned-intensity.jpeg')
title('rg-chromaticity binned intensity ')