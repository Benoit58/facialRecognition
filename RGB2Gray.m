function [J]=RGB2Gray(I)
  %conversion  d'image couleur en niveau de gris
  J=round(0.3*I(:,:,1)+0.59*I(:,:,2)+0.11*I(:,:,3));
endfunction