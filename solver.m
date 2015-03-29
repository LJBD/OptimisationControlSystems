function [ output ] = solver( func, t0, T, N, MSHDNS,x0 )

h = (T-t0)/(N+1);
t=t0;

%Do wywalenia
figure(1);
hold on;

while(t<=T-h)
    % W miêdzyczasie sterowanie pewnie bêdzie siê zmienia³o
    u= 6.4;
    %if t>T/2 u=70; end
    [tx,x] = RKIV(func, t, t+h, MSHDNS, x0, u);
    x0 = x(length(x),:)';
    t = t+h;
    %Do wywalenia
    subplot(2,1,1);
    hold on;
    plot(tx,x(:,1),'g');% pause(0.1);
    plot(tx,x(:,2),'r');
    subplot(2,1,2);
    hold on;
    plot(tx,x(:,3));
end
subplot(2,1,1);
grid;
legend('polozenie','predkosc');
subplot(2,1,2);
legend('prad');
grid;
output=0;
end
