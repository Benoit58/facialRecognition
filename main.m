#Interface

%Ferme toutes les fenetres, supprime les variables et clear la fenetre de command.
clc;
clear all;
close all;





%Variable global
%Image par défault
global IMAGE = imread("./Visages/test1.gif");

global FOLDER = ["./Visages"];

global EXTENSION;

%Nombre d'image a cherché
global NOMBRE_OCCURENCE = 1;

%Matrice contenant toutess les images Vectorielle
global M; 

%Visage moyen
global VISAGE_Moyen;

creationMatrice(FOLDER);


%Fenetre principale.
mainWindows = figure('name','Face ID', 'position',[0 0 1000 600], 'menubar','none', 'numbertitle','off');
uicontrol('style','text', 'string','Face Detection','units','normalized', 'position', [.05 .85 .9 .1], ...
  'foregroundcolor', 'w', 'backgroundcolor',[.4 .4 .4],'horizontalalignment','center', ...
  'fontsize',20);

%Creation de panels.
mainImgPanel = uipanel('title','Main Image', 'position',[.05 .40 .40 .40]);
rotationPanel = uipanel('title','Rotation','position',[.46 .40 .13 .40]);
settingsPanel=uipanel('title','Settings', 'position',[.60 .40 .35 .40]);
resultPanel=uipanel('title','Result', 'position',[.05 .03 .90 .35]);

%Image  a cherché
subplot(1,1,1,'Parent',mainImgPanel);
imshow(IMAGE);


%contenu du panel Rotation
uicontrol(rotationPanel,'style','pushbutton', 'string','Miror H','position',[10  170  100 30],'callback',{@miroirH,mainImgPanel});
uicontrol(rotationPanel,'style','pushbutton', 'string','Miror V','position',[10  135  100 30],'callback',{@miroirV,mainImgPanel});
uicontrol(rotationPanel,'style','pushbutton', 'string','Pi/2','position',[10  100  100 30],'callback',{@rotG,mainImgPanel});


%contenu du panel settingsPanel
uicontrol(settingsPanel,'style','pushbutton', 'string','Image Browse','position',[10  170  200 30],'callback',{@selectionImg,mainImgPanel});
uicontrol(settingsPanel,'style','pushbutton', 'string','Folder Browse','position',[10  135  200 30],'callback',@selectionFolder);
uicontrol(settingsPanel,'style','text', 'string','Occurrence:','position',[10 90 200 30],'foregroundcolor', 'b','horizontalalignment','left');
uicontrol(settingsPanel,'style','edit','string',num2str(NOMBRE_OCCURENCE),'position',[160 90 50 30], 'backgroundcolor','w','callback',@nbImgRecherche);
uicontrol(settingsPanel,'style','text','string','Algo:','position',[10 60 200 30],'foregroundcolor', 'b' ,'horizontalalignment','left');
algo = uicontrol(settingsPanel, 'style','popupmenu', 'string',{'Distance_Euclidienne','Histogramme','EigenFaces'}, 'position',[75 60 270 30],'backgroundcolor','w');
temps = uicontrol(settingsPanel,'style','text', 'string','Temps:','position',[10  10  160 40],'foregroundcolor', 'r','horizontalalignment','left','fontsize',8);
uicontrol(settingsPanel,'style','pushbutton', 'string','START','position',[180  10  160 40],'foregroundcolor', 'g','callback',{@start,algo,resultPanel,temps});



