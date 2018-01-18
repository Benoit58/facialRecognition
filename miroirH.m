function miroirH(hsrc,event,mainImgPanel)
  #Fonction produit un miroir horizontal de IMAGE

  global IMAGE;
  H = size(IMAGE,1);
  
  for i=1:1:H
  MirrorH(H+1-i,:)=IMAGE(i,:);
  end
  
  IMAGE=MirrorH;
  
  enfants=get(mainImgPanel,'Children');
  delete(enfants);
  
  subplot(1,1,1,'Parent',mainImgPanel);
  imshow(IMAGE);

endfunction