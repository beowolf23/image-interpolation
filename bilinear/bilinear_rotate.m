
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicand interpolare biliniara.
    % rotation_angle este exprimat in radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif
    
    I = double(I);

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % TODO: calculeaza cos si sin de rotation_angle
    cosA = cos(rotation_angle);
    sinA = sin(rotation_angle);
    % TODO: initializeaza matricea finala
    R = zeros(m, n);
    % TODO: calculeaza matricea de transformare
    T = [cosA -sinA; sinA cosA];
    % TODO: calculeaza inversa transformarii
    T_inv =  inv(T);
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            v = T_inv * [x y]';
            x_p = v(1);
            y_p = v(2);
            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            xp = x_p + 1;
            yp = y_p + 1;
            % TODO: daca xp sau yp se afla in afara imaginii, pune un pixel
            % negru in imagine si treci mai departe
          
            if(xp > 0 && xp < n && yp > 0 && yp < m) 
            % TODO: afla punctele ce inconjoara punctul (xp, yp)
              [x1 y1 x2 y2] = surrounding_points(n, m, xp, yp);
              if(x1 > 0 && y1 > 0)
            % TODO: calculeaza coeficientii de interpolare a
                a = bilinear_coef(I, x1, y1, x2, y2);
            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
                R(y + 1, x + 1) = a(1) + a(2)*xp + a(3)*yp + a(4)*xp*yp;
              else
                R(y+1, x + 1) = 0;
              endif
            else
              R(y + 1, x + 1) = 0;
            endif
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            endfor
    endfor
    % transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
endfunction
