clc             % Clear command window
clear           % Clear workspace

% The Starting Point Of The Robot
X_Start = 1;
Y_Start = 1;

% The Target Point Of The Robot (Destination)
X_Target = 4;
Y_Target = 6;

% Block Coordinates
a = [0 4];
b = [6 8];
y1 = [7 7];

c = [2 4];
d = [6 10];
y2 = [4 4];

hold on
plot(a,y1,'linewidth',5, 'MarkerSize',2);
plot(b,y1,'linewidth',5, 'MarkerSize',2);

plot(c,y2,'linewidth',5, 'MarkerSize',2);
plot(d,y2,'linewidth',5, 'MarkerSize',2);

plot(X_Start,Y_Start,'rs');
plot(X_Target,Y_Target,'rs','MarkerFaceColor','Blue','MarkerEdgeColor','Blue');

axis([0 10 0 10])

% The Number Of Robot Steps
n=3;
