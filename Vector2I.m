function J = Vector2I(I)
  %conversion de vecteur en image
  [H L C]=size(I);
  J=reshape(I,[sqrt(H),sqrt(H)]);
endfunction