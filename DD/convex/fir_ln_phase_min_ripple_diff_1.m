clc
clear all
close all
mm=901;n = 30;lbd=1;v=0.5;
wpass = pi;
wstop = pi;        % sband start freq (in radians)
atten_level = -10;      % stopd atuation level in dB

%********************************ban****ten*****top***************************
% create optimization parameters
%********************************************************************
N = 30*n+1;                            % freq samples (rule-of-thumb)
w = linspace(0,pi,N);
% A = [ones(N,1) 2*cos(kron(w',[1:n-1]))]; % matrix of cosines
A=2*[sin(kron(w',[0.5:1:(2*n-1)/2]))];%type IV
% passband 0 <= w <= w_pass
ind1 = find((0.05 <= w) & (w <= wpass));   % passband
Ap  = A(ind1,:);

% transition band is not constrained (w_pass <= w <= w_stop)

% stopband (w_stop <= w)
ind2 = find((wstop <= w) & (w <= pi));  % stopband
Us  = 10^(atten_level/20)*ones(length(ind2),1);
As  = A(ind2,:);

%********************************************************************
% optimization
%********************************************************************
% formulate and solve the linear-phase lowpass filter design
cvx_begin
  variable delta
  variable h(n,1);

  minimize( delta )
  subject to
    % passband bounds
%     Ap*h <=(w(ind1).').^v+ delta;
%     Ap*h >= ((w(ind1).').^v)-delta;
 Ap*h <=(w(ind1).').^v+ delta;
    Ap*h >= [zeros(1,8) ((w(ind1(9:length(ind1)))).^v)-delta].';
    % stopband bounds
%     abs( As*h ) <= Us;
cvx_end

% check if problem was successfully solved
disp(['Problem is ' cvx_status])
if ~strfind(cvx_status,'Solved')
  return
else
  % construct the full impulse response
  hc =[-flipud(h);h];
  
end
[H1 ww]=freqz(hc,1,mm);
 hold on
 plot(abs(H1),'k','LineWidth',1.7)
 a3=[linspace(0,pi,mm)].^v;
 plot(a3,'r')
 pt=ceil(lbd*mm);
 xx=abs(H1).';
fxc=(abs(a3(1:ceil(pt))-xx(1:ceil(pt)))).^2;
convex=(((fxc(1)+fxc(end))/2)+(sum(fxc(2:end-1))))*lbd/pt;
grid on

%% 

 sig=2.3;N=80;I=20;L=620;v=0.5;ss=0;h=0.1;%III.1
for m=0:N
    for k=0:L
    ss=ss+((-1)^k)*gamma(v+1)*gee(m,I+k*h,N,sig)/((h^v)*gamma(k+1)*gamma(v-k+1));
    end
    b(m+1)=ss;
    ss=0;
end

[H,w]=freqz(b,1,mm);
% a=[linspace(0,pi,151)].^v;
% plot((1:151)*(pi/151),a,'r')
% x1=a(30)/abs(H(30));
figure(2)
plot(a3,'k','LineWidth',1.7)
hold on
plot(abs(H),'LineWidth',1.7);title('radial basis')
set(gca,'XTick',0:length(H)/10:length(H),'XTickLabel','0|0.1  |0.2  |0.3  |0.4  |0.5  |0.6  |0.7  |0.8  |0.9  | 1')
  xlabel('frequency in pi units');ylabel('Magnitude response');
grid on
plot(abs(H))
xy=abs(H).';
fxr=(abs(a3(1:ceil(pt))-xy(1:ceil(pt)))).^2;
radbas=(((fxr(1)+fxr(end))/2)+(sum(fxr(2:end-1))))*lbd/pt;
convex
% legend('convex','zhaos','ideal','radial basis','Location','Northwest')
% set(gca,'XTick',0:length(H)/10:length(H),'XTickLabel','0|.1*pi|.2*pi|.3*pi|.4*pi|.5*pi|.6*pi|.7*pi|.8*pi|.9*pi|pi')