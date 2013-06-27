close all; clear all; clc;
dbg = ~true;
db = '../_db/';
db_64x64_fg = strcat(db, '64x64_shadow/Cutted_Body_masks/');

%dip_initialise('silent');

%% Datastore
load(strcat(db, 'features.mat'));

%% Seperation Points
% Ground Truth'lari yukle ve uzerine hesaplananlari ekle
%load(strcat(db, 'seperation_points_ground_truth.mat'));
hedef = [];
giris = [];
psz = size(features, 3);
for pi=1:psz
    if true, fprintf('%03d/%03d. kisi isleniyor...\n', pi, psz); end

    ssz = cellsize(features, pi);
    for si=1:ssz
        if true, fprintf('\t%1d/%1d. seq isleniyor...\n', si, ssz);  end

        clear seq_frms;
        fsz = cellsize(features, pi, si);
        for fi=1:fsz
            if true, fprintf('\t\t%03d/%03d. frame isleniyor...\n', fi, fsz);    end
            
            bw = features{fi, si, pi}.project;
            if(si == 1) %el kaldirma
                fprintf('el kaldirma\n');
                giris = [giris; reshape(bw,1,[])];
                hedef = [hedef; 0,0,0];
            elseif(si == 4) %yurume
                fprintf('yurume\n');
                giris = [giris; reshape(bw,1,[])];
                hedef = [hedef; 0,0,1];
                
            elseif(si == 9) %ziplama
                fprintf('z�plama\n');
                giris = [giris; reshape(bw,1,[])];
                hedef = [hedef; 0,1,1];
            end
        end
    end
end
save('giris.mat','giris')
save('hedef.mat','hedef')

  
     
       
        
        
       
      
        





