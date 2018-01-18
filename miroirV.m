function miroirV(hsrc,event,mainImgPanel)
  #Fonction produit un miroir Vertical de IMAGE

  global IMAGE;
  L = size(IMAGE,2);
  
  for j=1:1:L
    MirrorV(:,L+1-j)=IMAGE(:,j);
  end
  
  IMAGE=MirrorV;
  
  enfants=get(mainImgPanel,'Children');
  delete(enfants);
  
  subplot(1,1,1,'Parent',mainImgPanel);
  imshow(IMAGE);

endfunction