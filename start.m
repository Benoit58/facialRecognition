function start(h,e,algo,resultPanel,temps)
  #lance le traitement en fonction de l'algo selectionner et affiche les image les plus proches
  tic;
  
  
  global NOMBRE_OCCURENCE;
  global M;
  global VISAGE_Moyen;
  global IMAGE;
  
  
  
  menu  = get(algo,'string');         % récupère articles du menu popup 
  fct = menu{get(algo,'value')};      % récupère l'article sélectionné
  switch fct
    case 'Distance_Euclidienne'
      disp("distance eucli"); 
      for i = 1:size(M,2)
        d=10000000000000;
        I(:,i)= M(:,i)-VISAGE_Moyen;      
        D(i) = norm(I(:,i)-I2Vector(double(IMAGE)));
      end
      for i=1:NOMBRE_OCCURENCE
        [mini(i) indice(i)]=min(D);
        D(indice(i)) = 10000000000;
      end

      
    case 'Histogramme'
      disp("histo"); 
      x = 0:5:255;
      dis = I2Vector(IMAGE) - VISAGE_Moyen;
      [F val] = hist(dis(:),x);
      J = F/(size(M,1));
      for i =1:size(M,2)
        dis = M(:,i) - VISAGE_Moyen;
        [F val] = hist(dis(:),x);
        W = F/(size(M,1));
        d(i) = -log(sum(sqrt(J.*W)));
      end
      [valeur,ind]=sort(d);
      indice=ind(1:NOMBRE_OCCURENCE);
      
    case 'EigenFaces'
      disp("E F");

  end
  
  enfants=get(resultPanel,'Children');
  delete(enfants);

  for i = 1:NOMBRE_OCCURENCE
    monsubplot = subplot(1,NOMBRE_OCCURENCE,i,'Parent',resultPanel);
    imshow(uint8(Vector2I(M(:,indice(i)))));

  end
  
  delta = toc;
  set(temps,'string',strcat(strcat('Temps: ',num2str(delta)),' s'));

endfunction