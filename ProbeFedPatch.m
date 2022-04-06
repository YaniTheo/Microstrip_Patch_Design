%% Probe fed patch 

clc
clear 
c=3e8;   %velocity of light 
f=10e9;  % operating frequency
lambda=c/f; % the wavelenght of free space
epsr=4.4;   %the relative permittivity 
h=1.6e-3;   % thickness of substrate 
zo=50;


w=(c/(2*f))*sqrt(2/(epsr+1)); %width of the radiator element
epsreff=(epsr+1)/2+((epsr-1)*(1+12*(h/w))^(-0.5))./2;% effective dielectric constant of substrate
Leff=c/(2*f*sqrt(epsr)) ;   % the effective length of the radiator element
deltaL=(0.412*h*(epsreff+0.3)*((w/h)+0.264))/((epsreff-0.258)*((w/h)+0.8));%the extension length
L=Leff-2*deltaL ;    %length of radiator

Lgr=L+12*h;
Wgr = w+12*h;
x= ((L/6)+(L/4))/2; % from the center of the patch (Another rule of thumb is lamda/4)
disp('If probe is placed along the x axis then TM10 is excited')
disp(['The width of the patch is ',num2str(w*1000), ' mm along the y-direction'])
disp(['The length of the patch is ',num2str(L*1000), ' mm along the x-direction'])
disp(['The width of the ground plane is ',num2str(Wgr*1000), ' mm'])
disp(['The lentgth of the ground plane is ',num2str(Lgr*1000), ' mm'])
disp(['Substrate heigth is ',num2str(h*1000), ' mm'])
disp(['The probe feed position should be ',num2str(x*1000),' mm from the center of the patch along the (-)x-direction'])