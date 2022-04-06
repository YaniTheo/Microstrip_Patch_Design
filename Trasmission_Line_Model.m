%% Mutual conductance

clc
clear

a=@(th)(((sin((2.4840/2).*cos(th))./cos(th)).^2).*(besselj(0,((2*pi/3).*0.906.*sin(th)))).*(sin(th)).^3);
a1=quad(a,0,pi);
g12=a1/(377*pi)   

%%

clear all; clc; 
format long;
%%%%%%script for all equations useful in rectangular microstrip%%%%%%%%%
%%%%%% antenna design & its feeding with microstrip line with inset and coaxfeed%%%%%%% 
c=3e8; 
%velocity of light 
f=10e9;
% operating frequency
lambda=c/f; 
% the wavelenght of free space
epsr=4.4;
%the relative permittivity 
h=1.6e-3;
% thickness of substrate 
zo=50;
%the characteristic impedance of feed line 
w=(c/(2*f))*sqrt(2/(epsr+1))
%width of the radiator element 
epsreff=(epsr+1)/2+((epsr-1)*(1+12*(h/w))^(-0.5))./2;
% effective dielectric constant of substrate
Leff=c/(2*f*sqrt(epsr)) ;
% the effective length of the radiator element
deltaL=(0.412*h*(epsreff+0.3)*((w/h)+0.264))/((epsreff-0.258)*((w/h)+0.8));
%the extension length
L=Leff-2*deltaL
%the length of radiator element 
Lgr=2*L
wgr=2*w
%Or
%Lgr=L+6*h
%Wgr=W+6*h
%the length & the width of the ground plane and substrate 
lambdag=lambda/sqrt(epsreff);
%the wavelength inside the feed line 
Lf=lambdag/4;
% the length of quarter tine transformer
zin=90*((epsr^2)/(epsr-1))*(L/w)^2
%input impedance of radiator element
zc=sqrt(zin*zo)
%characteristic impedance of quarter linge transformer
a=(zo/60)*sqrt((epsr+1)/2)+((epsr-1)/(epsr+1))*(0.23+(0.11/epsr));
b=(377*pi)/(2*zo*sqrt(epsr)); 
wf1=8*h*exp(a)/(exp(2*a)-2);
wf2=(2/pi)*h*(b-1-log(2*b-1)+(epsr-1)*(log(b-1)+0.39-(0.61/epsr))/(2*epsr));
if  wf1<2*h
      wf=wf1
    else 
         wf=wf2
end 
%width Wf of feed line that has Zo as characteristic impedance
a1=(zc/60)*sqrt((epsr+1)/2)+((epsr-1)/(epsr+1))*(0.23+(0.11/epsr));
b1=(377*pi)/(2*zc*sqrt(epsr)); 
wf11=8*h*exp(a1)/(exp(2*a1)-2);
wf22=(2/pi)*h*(b1-1-log(2*b1-1)+(epsr-1)*(log(b1-1)+0.39-(0.61/epsr))/(2*epsr));
if  wf11<2*h
    wqr=wf11
     else 
             wqr=wf22
end 
%width Wqr of quarter line transformer that has ZC as characteristic impedance
k=(2*pi)/lambda;
x=k*(w);
i1=-2+cos(x)+(x*sinint(x))+(sin(x)/x);
g1=i1/(120*pi*pi);     
    %Conductance

a=@(th)(((sin((x./2).*cos(th))./cos(th)).^2).*(besselj(0,(k.*L.*sin(th)))).*(sin(th)).^3);
a1=quad(a,0,pi);
g12=a1/(120*pi*pi);     
r_in=1/(2*(g1+g12));    
inset=(L/pi)*(acos(sqrt(zo/r_in)))       
% distance of inset as technique for good matching
B=60*pi*pi/(zo*sqrt(epsr)); 
m1=2*B-1;
m=log(m1);
n1=B-1;
n=log(n1);

W=(2*h/pi)*(B-1-m+(((epsr-1)/(2*epsr))*(n+(0.39*0.61)/epsr)));   
g = (3e8*4.65e-9)/(sqrt(2*epsreff)*f)
% the gap of the feed line

