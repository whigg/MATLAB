%% Program for plots of salesnick,fourier series, parks mcclellan, convex optimizaiton, maa differentiatorI
clc
clear all
close all
format long G
load('F:\Users\JC\Documents\xx.mat')
hf=Expression1;
R=20000;
for i=0:(R/2)-1
    u(i+1)=(2/R)*i;
end
%% MAA coefficients low pass diff 1
la1=[1 -.4398 .4672 -.0403 -.017]; %MAA .35 coeffs
lb1=[.0386 .0772 0 -.0772 -.0386];
[ma1,maw1]=freqz(lb1,la1,R/2);ma1=abs(ma1);

 %%  length(h) = K+2L+2 salesnick's filter responses and maa
 K=13;
  L = (-K+29)/2-1;  
h1 = lowdiff(K,L);
[H1,w1] = freqz(h1,1,R/2);
hh=abs(H1)/pi;
 plot(w1/pi,hh,'k','LineWidth',1.3);
hold on
grid on

plot(maw1/pi,u,'-.k','LineWidth',1.3)
plot(maw1/pi,abs(ma1),'r','LineWidth',1.3)
%% fourier series diff plots
[Hf,wf] = freqz(hf,1,R/2);
% ho=abs(Hf)*.1/abs(Hf(1000));
   ho=abs(Hf)/pi;
plot(wf/pi,ho,'LineWidth',1.3);

%% convex optimization 
n = 29;
v=1;
wpass = 0.35*pi;   % end of the passband
wstop = 0.5*pi;   % start of the stopband
delta = .01;         % maximum passband ripple in dB (+/- around 0 dB)

m = 15*n;
w = linspace(0,pi,m)'; % omega

% A is the matrix used to compute the power spectrum
% A(w,:) = [1 2*cos(w) 2*cos(2*w) ... 2*cos(n*w)]
A = [ones(m,1) 2*cos(kron(w,[1:n-1]))];

% passband 0 <= w <= w_pass
ind1 = find((0 <= w) & (w <= wpass));    % passband
Lp  = ((w(ind1)).^v)+10^(-delta/20)*ones(length(ind1),1)-1;
Up  = ((w(ind1)).^v)+10^(+delta/20)*ones(length(ind1),1)-1 ;
Ap  = A(ind1,:);
bb=find(Lp>=0);
Lp(1:bb(1)-1)=0;
% transition band is not constrained (w_pass <= w <= w_stop)

% stopband (w_stop <= w)
ind = find((wstop <= w) & (w <= pi));   % stopband
As  = A(ind,:);

%********************************************************************
% optimization
%********************************************************************
% formulate and solve the magnitude design problem
cvx_begin
  variable r(n,1)

  % this is a feasibility problem
  minimize( max( abs( As*r ) ) )
  subject to
    % passband constraints
    Ap*r >= (Lp.^2);
    Ap*r <= (Up.^2);
    % nonnegative-real constraint for all frequencies (a bit redundant)
    A*r >= 0;
cvx_end

% compute the spectral factorization
hc = spectral_fact(r);
[Hfc,wfc] = freqz(hc,1,R/2);
   hoc=abs(Hfc)/pi;
plot(wf/pi,hoc,'-.b','LineWidth',1.3);
%% parks-mcclellan
load('D:\MATLAB 2010 Portable\bin\cvx\examples\filter_design\fipm.mat')
[Hfpm,wfpm] = freqz(Num,1,R/2);
   hopm=abs(Hfpm);
plot(wf/pi,hopm,'-.r','LineWidth',1.3);
%% error plots

figure(2)
for i=1:R/2
    
    E(i)=u(i)-hh(i);
end
th=find(E*1000/pi>=10);
plot(maw1(1:th(1))/pi,E(1:th)*1000/pi,'k','LineWidth',1.3)
hold on

for i=1:R/2
    E(i)=u(i)-ma1(i);
end
th=find(E*1000/pi>=10);
plot(maw1(1:th(1))/pi,E(1:th)*1000/pi,'r','LineWidth',1.3)
grid on

for i=1:R/2
    E(i)=u(i)-ho(i);
end
th=find(E*1000/pi>=10);
plot(maw1(1:th(1))/pi,E(1:th)*1000/pi,'LineWidth',1.3)
grid on
for i=1:R/2
    E(i)=u(i)-hoc(i);
end
th=find(E*1000/pi>=10);
plot(maw1(1:th(1))/pi,E(1:th)*1000/pi,'g','LineWidth',1.3)

for i=1:R/2
    E(i)=u(i)-hopm(i);
end
th=find(E*1000/pi>=10);

plot(maw1(1:th(1))/pi,E(1:th)*1000/pi,'-k','LineWidth',1.3);xlabel('Frequency (Hz)');ylabel('%age error');


