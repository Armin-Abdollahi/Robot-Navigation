clc             % Clear command window
clear           % Clear workspace

%% Create environment

X_Min = 0;
X_Max = 10;

Y_Min = 0;
Y_Max = 10;

axis([X_Min X_Max Y_Min Y_Max]);

Lower_Boundary = [X_Min X_Max];
Upper_Boundary = [Y_Min Y_Max];

%% The starting point of the robot
X_Start = 1;
Y_Start = 1;

%% The target point of the robot (destination)
X_Target = 4;
Y_Target = 6;

%% Create block (Block coordinates)
X_Line1 = [0.5 4];                        % X_Line1 is the X axis coordinates of line 1
Y_Line1 = [7 7];                          % Y_Line1 is the Y axis coordinates of line 1

X_Line2 = [7 9.5];                        % X_Line2 is the X axis coordinates of line 2
Y_Line2 = [8 8];                          % Y_Line2 is the Y axis coordinates of line 2

X_Line3 = [1.25 4];                       % X_Line3 is the X axis coordinates of line 3
Y_Line3 = [3 3];                          % Y_Line3 is the Y axis coordinates of line 3

X_Line4 = [6 10];                         % X_Line4 is the X axis coordinates of line 4
Y_Line4 = [5 5];                          % Y_Line4 is the Y axis coordinates of line 4

X_Circle = 7;                             % X_Circle is the X axis coordinates center of the circle
Y_Circle = 2.3;                           % Y_Circle is the Y axis coordinates center of the circle
R_Circle = 1;                             % R_Circle is the radius of the circle
theta = linspace(0,2*pi);                 %
x = R_Circle*cos(theta) + X_Circle;       %
y = R_Circle*sin(theta) + Y_Circle;       %

%% Plot the blocks & robot
hold on
plot(X_Line1,Y_Line1,'linewidth',5, 'Color','Black');    % Plot the line 1

plot(X_Line2,Y_Line2,'linewidth',5, 'Color','Black');    % Plot the line 2

plot(X_Line3,Y_Line3,'linewidth',5, 'Color','Black');    % plot the line 3

plot(X_Line4,Y_Line4,'linewidth',5, 'Color','Black');    % Plot the line 4

plot(x,y, 'Color','Black');                              % Plot the circle

plot(X_Start,Y_Start,'rs');                              % Plot the robot start point coordinates

plot(X_Target,Y_Target,'rs', 'Color','Blue');            % Plot the robot target point coordinates

%% The number of robot steps
n=3;

%% The number of variable
nvar=2*n;
