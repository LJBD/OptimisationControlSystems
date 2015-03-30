function [ tx, x ] = solverChanged( func, T, U0, MSHDNS, x0)

Umin=5.56;
Umax= 9.56;
U=repmat(U0,1,length(T));
for j=2:2:length(U)
    U(j)=ifelse(U(1)==Umin,Umax,Umin);
end

for i=1:length(T)-1
    [tx,x] = RKIV(func, T(i), T(i+1), MSHDNS, x0, U(i));
    x0 = x(end,:)';
    
    %Rysowanie
    subplot(2,1,1);
    hold on;
    plot(tx,x(:,1),'g');% pause(0.1);
    plot(tx,x(:,2),'r');
    subplot(2,1,2);
    hold on;
    plot(tx,x(:,3));
end
%Opisywanie osi
subplot(2,1,1);
grid;
legend('polozenie','predkosc');
subplot(2,1,2);
legend('prad');
grid;
end
