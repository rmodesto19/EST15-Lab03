% Setup
load('extract.mat')
for caso = 1:2
    if caso == 1
        load('properties1.mat')
    else
        load('properties2.mat')
    end
    
    for i = 1:2:15
        m_max = i;
        n_max = i;
        pmn = zeros(m_max,n_max);
        amn = zeros(m_max,n_max);
        for m = 1:m_max
            for n = 1:n_max
                pmn(m,n) = double(4/l1/l2*int(int(q*sin(m*pi*x/l1)*sin(n*pi*y/l2),x,0,l1),y,0,l2));
                amn(m,n) = pmn(m,n)/(pi^4*D)/((m/l1)^2+(n/l2)^2)^2;
            end
        end
        w = @(x,y)navier(x,y,l1,l2,amn);
    
        kxx = -diff(w,x,x);
        kyy = -diff(w,y,y);
        kxy = -2*diff(w,x,y);
      
        def = z.*[kxx kyy kxy]';
        tensoes = A*def;
        momentos = (t^3/12/z)*tensoes;
        vec = [i w def(1) def(2) def(3) tensoes(1) tensoes(2) tensoes(3) momentos(1) momentos(2) momentos(3)];
        v((i+1)/2,:) = vec;
    end
    
    if caso == 1
            save("vec1.mat")
    elseif caso == 2
            save("vec2.mat")
    end
end

clear

function w = navier(x,y,l1,l2,amn)
    x = x/l1;
    y = y/l2;
    w = 0;
    for m = 1:size(amn,1)
        for n = 1:size(amn,2)
            w = w + amn(m,n)*sin(m*pi*x)*sin(n*pi*y);
        end
    end
end