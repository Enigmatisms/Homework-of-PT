function fix_distortion(X, Y, Z)
k1 = -0.419212525827893;
k2 = 0.175006995615751;
p1 = 0.00489209817799368;
p2 = -0.00289049464268412;
xd = p2*((3*X^2)/Z^2 + Y^2/Z^2) + (X*(k2*(X^2/Z^2 + Y^2/Z^2)^2 + k1*(X^2/Z^2 + Y^2/Z^2) + 1))/Z + (2*X*Y*p1)/Z^2;
yd = p1*(X^2/Z^2 + (3*Y^2)/Z^2) + (Y*(k2*(X^2/Z^2 + Y^2/Z^2)^2 + k1*(X^2/Z^2 + Y^2/Z^2) + 1))/Z + (2*X*Y*p2)/Z^2;
fprintf("Xdis is %f while X/Z is %f, with diff:%f\n", xd, X/Z, xd-X/Z);
fprintf("Ydis is %f while Y/Z is %f, with diff:%f\n", yd, Y/Z, yd-Y/Z);
end

