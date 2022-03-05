function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green = img(:,:,2); 
    % TODO: extrage canalul albastru al imaginii
    blue = img(:,:,3);
 
    black = zeros(size(img, 1), size(img, 2), 'uint8');
    
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    red_fin = nn_resize(red, p, q);
    green_fin = nn_resize(green, p, q);
    blue_fin = nn_resize(blue, p, q);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, red_fin, green_fin, blue_fin);
    % Hint: functia cat

endfunction
