function creationMatrice(foldername)
  #creation de la matrice de la bonne taille et la remplie dans le même temps  
  global IMAGE;
  global M;
  global VISAGE_Moyen;
  
  d = dir(foldername);
  nbfichier = size (d,1);
  tailleImg = (size(IMAGE,1)*size(IMAGE,2));
  
  m = zeros(tailleImg,(nbfichier-2));
  
  for i = 3:nbfichier
     I = imread(strcat(strcat(foldername,"/"),d(i).name));
     [h l c]= size(I);
     if ((h*l)==tailleImg)
       if (c == 3)
         I = RGB2Gray(I);
       endif
       I = I2Vector(double(I));
       m(:,(i-2)) = I;
       
     endif  
  end
  
  
  
  M = m;
  
  VISAGE_Moyen = mean(M,2);
endfunction