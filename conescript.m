
% few measured constants
sound_speed = 340*100; %cm/s
time_d15 = 72.5*1e-6;
time_d35 = 88.6*1e-6;
time_d13 = 161.5*1e-6;
time_d24 = 10*1e-6;


val15 = (time_d15*sound_speed)/(3.1);
val35 = (time_d35*sound_speed)/(3.6)
val13 = (time_d13*sound_speed)/(6.7);
val24 = (time_d24*sound_speed)/(6.5);

sprintf('val,%f,%f,%f,%f',val15,val35,val13,val24)

% calculating half of aperture angles
theta15 = (90.0-(180.0/3.14)*acos(val15));
theta35 = (90.0-(180.0/3.14)*acos(val35))
theta13 = (90.0-(180.0/3.14)*acos(val13));
theta24 = (90.0-(180.0/3.14)*acos(val24));

if theta24>0
    sgn = 1;
else
    sgn  = -1;
end

if theta13<theta24
    theta = angle13;
else
    theta = (sgn*pi/2)+theta13;
end


sprintf('angles')
sprintf('theta15,%f',(180.0/3.14)*theta15)
sprintf( 'theta35,%f',(180.0/3.14)*theta35)
sprintf( 'theta13,%f',(180.0/3.14)*theta13)
sprintf( 'theta24,%f',(180.0/3.14)*theta24)

% theta is with x axis, means that the equation of the plane will be 
% y = x tan theta


m1 = [0,23.68,0];
m2 = [-33.48,0,0];
m3 = [0,-29.93,0];
m4 = [32.31,0,0];
m5 = [0,0,20];


m15 = [0,11.84,10];
m25 = [-16.74,0,10];
m35 = [0,-14.65,10];
m45 = [16.15,0,10];


v15 = [0,11.84,10];
v13 = [0,0,0];
v45 = [16.5,0,10];
v25 = [-16.74,0,10];
v35 = [0,-14.5,10];


[X15,Y15,Z15] = cone(theta15,[m1;m5],50);
[X35,Y35,Z35] = cone(theta35,[m3;m5],50);
[X13,Y13,Z12] = cone(theta13,[m1;m3],50);




%mesh(X,Y,Z)
mesh(X15+v15(1),Y15+v15(2),Z15+v15(3));
hold on;

axis equal
axis([-50 50 -50 50 -50 50])
xlabel('x')
ylabel('y')
zlabel('z')
%camroll(90)
%surf(Xnew,Ynew,Znew);

m=[m1;m2;m3;m4;m5];
g = [m15;m25;m35;m45];
scatter3(m(:,1),m(:,2),m(:,3),'filled')
labels = num2str((1:size(m,1))','%d');    %'
text(m(:,1), m(:,2),m(:,3), labels, 'horizontal','left', 'vertical','bottom')

scatter3(g(:,1),g(:,2),g(:,3),'filled')
labels = num2str((1:size(g,1))','mid:%d');    %'
text(g(:,1), g(:,2),g(:,3), labels, 'horizontal','left', 'vertical','bottom')


hold on;

x = [m1;m5;m2;m5;m3;m5;m4;m5;m1;m3;m2;m4;m1;m2;m3;m4];
plot3(x(:,1),x(:,2),x(:,3),'g');
hold on;

mesh(X13+v13(1),Y13+v13(2),Z13+v13(3));
hold on;

%mesh(X45+v45(1),Y45+v45(2),Z45+v45(3));
mesh(X35+v35(1),Y35+v35(2),Z35+v35(3));
hold off

%surf(X35-X13-X15,Y35-Y13-Y15,Z35-Z13-Z15);
%hold off;


