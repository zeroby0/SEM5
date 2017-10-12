function [a,b,c] = threedangle(x,y,z)
  a = [];
  b = [];
  c = [];
  for i = 1:length(x)
    if ((x(i).^2 + y(i).^2 + z(i).^2).^0.5) == 0
     a = [a 0];
     b = [b 0];
     c = [c 0];
    else
    
    a = [a x(i)/((x(i).^2 + y(i).^2 + z(i).^2).^0.5)];
    b = [b y(i)/((x(i).^2 + y(i).^2 + z(i).^2).^0.5)];
    c = [c z(i)/((x(i).^2 + y(i).^2 + z(i).^2).^0.5)];
    end
  end
end