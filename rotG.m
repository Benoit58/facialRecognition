function rotG(hsrc,event,mainImgPanel)
  #effectue une rotation pi/2 de IMAGE

  global IMAGE;
  [H L]= size(IMAGE);
  
  for i=1:1:H
    for j=1:1:L
      RotPiSur2(H+1-j,i)=IMAGE(i,j);#Rotation pi/2
      #RotPiSur2(H+1-j,L+1-i)=I(i,j);#Rotation -pi/2
    end
  end
  
  IMAGE=RotPiSur2;
  
  enfants=get(mainImgPanel,'Children');
  delete(enfants);
  
  subplot(1,1,1,'Parent',mainImgPanel);
  imshow(IMAGE);

endfunction