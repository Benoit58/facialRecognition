function J = I2Vector(I)
  %conversion d'image en vecteur
  [H L C]=size(I);
  J = reshape(I,[(H*L), C]);
endfunction