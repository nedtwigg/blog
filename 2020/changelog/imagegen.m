%% Original
rgb = imread('lena-rgb.png');

subplot(3,2,1)
imshow(rgb)
title('original')

subplot(3,2,2)
imshow(rgb)
title('original')

unit = ones(size(rgb,1), size(rgb,2));
r = double(rgb(:,:,1)); 
g = double(rgb(:,:,2));
b = double(rgb(:,:,3));

%% 0.(r+g).b
subplot(3,2,3)
imshow(uint8(cat(3, 0*unit, min(255, r + g), b)))
title('0.(r+g).b - saturates, but version numbers dont')

%% 0.(r+g)/2.b
subplot(3,2,4)
imshow(uint8(cat(3, 0*unit, (r + g)/2, b)))
imwrite(uint8(cat(3, 0*unit, (r + g)/2, b)), 'lena-0.r+g.b.jpeg')
title('0.(r+g)/2.b')

%% rg chromaticity
subplot(3,2,5)

tot = r+g+b;
rg_averaged = 0.5*(r+g)./tot;
imshow(cat(3, r./tot, g./tot, b./tot))
imwrite(cat(3, r./tot, g./tot, b./tot), 'lena-rgb-chromaticity.jpeg')
title('rgb chromaticity')

%% 0.rg chromaticity
subplot(3,2,6)

tot = r+g+b;
rg_averaged = 0.5*(r+g)./tot;
imshow(cat(3, 0*unit, rg_averaged, b./tot))
imwrite(cat(3, 0*unit, rg_averaged, b./tot), 'lena-0.rg-chromaticity.jpeg')
title('0.(rg-chromaticity).(b-chromaticity)')
