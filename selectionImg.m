function selectionImg(hsrc,event,mainImgPanel)
  #Fonction selection d'image

  global IMAGE;
  
  [filename, pathname] = uigetfile({'*.*'},'Image Choice:'); 
  if (filename == 0)
    return;
  endif
  img=imread(strcat(pathname,'/',filename));  
  [l h c] = size(img);
  if (c == 3)
    img = RGB2Gray(img);
  endif
  IMAGE=img;
  
  enfants=get(mainImgPanel,'Children');
  delete(enfants);
  
  subplot(1,1,1,'Parent',mainImgPanel);
  imshow(IMAGE);
  
endfunction