function selectionFolder(hsrc,event)
  #Fonction selection du dossier

  global FOLDER;
  
  foldername= uigetdir; 
  if (foldername == 0)
    return;
  endif    
  creationMatrice(foldername);
  FOLDER=foldername; 
  disp(FOLDER);
  
endfunction