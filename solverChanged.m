function [ t_out, x_out ] = solverChanged( func, T, U, MSHDNS, x0)

%Do wywalenia
%figure(1);
%hold on;
if (length(T) ~= length(U))
    return;
end

%while(t<=T-h)
for i=1:length(T)-1
    % W miêdzyczasie sterowanie pewnie bêdzie siê zmienia³o
    %u= 6.4;
    [tx,x] = RKIV(func, T(i), T(i+1), MSHDNS, x0, U(i));
    x0 = x(length(x),:)';
    
    %Do wywalenia
    subplot(2,1,1);
    hold on;
    plot(tx,x(:,1),'g');% pause(0.1);
    plot(tx,x(:,2),'r');
    subplot(2,1,2);
    hold on;
    plot(tx,x(:,3));
end
t_out = tx;
x_out = x;
%Rysowanie
subplot(2,1,1);
grid;
legend('polozenie','predkosc');
subplot(2,1,2);
legend('prad');
grid;
end
