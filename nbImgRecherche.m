function nbImgRecherche(h,e)
  #Fonction selection du nombre d'image a cherché d'image

  global NOMBRE_OCCURENCE;
  NOMBRE_OCCURENCE = str2num(get(h,'string'));
  if (NOMBRE_OCCURENCE<1 || NOMBRE_OCCURENCE>5)
    msg={'Le nombre d occurence doit être entre 1 et 5'};
    errordlg(msg, 'Error'); 
    NOMBRE_OCCURENCE = 1;
    set(h,'string',num2str(NOMBRE_OCCURENCE));
  endif;
endfunction