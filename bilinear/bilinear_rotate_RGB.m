function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    red = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green = img(:,:,2); 
    % TODO: extrage canalul albastru al imaginii
    blue = img(:,:,3);
    
    black = zeros(size(img, 1), size(img, 2), 'uint8');
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    
    fin_red = bilinear_rotate(red, rotation_angle);
    fin_green = bilinear_rotate(green, rotation_angle);
    fin_blue = bilinear_rotate(blue, rotation_angle);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, fin_red, fin_green, fin_blue);  
endfunction