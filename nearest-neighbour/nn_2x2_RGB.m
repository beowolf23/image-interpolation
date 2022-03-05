function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    green = img(:,:,2); 
    % TODO: extrage canalul albastru al imaginii
    blue = img(:,:,3);

    black = zeros(size(img, 1), size(img, 2), 'uint8');
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    
    fin_red = nn_2x2(red, STEP);
    fin_green = nn_2x2(green, STEP);
    fin_blue = nn_2x2(blue, STEP);
    
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    out = cat(3, fin_red, fin_green, fin_blue);  
    % Hint: functia cat
    
endfunction
