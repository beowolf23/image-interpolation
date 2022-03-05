function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green = img(:,:,2); 
    % TODO: extrage canalul albastru al imaginii
    blue = img(:,:,3);
    
    black = zeros(size(img, 1), size(img, 2), 'uint8');
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    
    fin_red = bilinear_2x2(red, STEP);
    fin_green = bilinear_2x2(green, STEP);
    fin_blue = bilinear_2x2(blue, STEP);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, fin_red, fin_green, fin_blue);  
endfunction
