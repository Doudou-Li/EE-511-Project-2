%The program for the problem 1:
i=20000;
p=0;
for n=1:20000                    %generate 20000 random points in the square with length l=1
   x1(n)=rand;
    y1(n)=rand;
    if (x1(n)^2+y1(n)^2<=1)    %judge whether each of these points fall into the quadrant with center at the origin and radius r=1
        p=p+1;                    %count the number of points falling into this quadrant
    end
end
l=4*p/n                           %estimate the value of pi
q=p/n;
s=q*(1-q)/n;
min=pi-4*1.96*s^(0.5)          %compute the 95% confidence interval for this trial
max=pi+4*1.96*s^(0.5)
 
m=1;
for i=1001:40000               %repeat this experiment for 39000 times with the total number of points from 1001 all the way to 40000
    p=0;
   a(1,m)=i;                 
for n=1:i                        %generate i(i from 1001 to 40000) random points in the square with length l=1   
    x2(n)=rand;
    y2(n)=rand;
    if (x2(n)^2+y2(n)^2<=1)  %judge whether each of these points fall into the quadrant with center at the origin and radius r=1
        p=p+1;                   %count the number of points falling into this quadrant
    end
end
    k(1,m)=4*p/n;              %estimate the value of pi for each trial
    m=m+1;
end                              %draw the graph with the number of random points as x-axis and its corresponding estimated value of pi as y-axis
plot(a,k);
hold on;
grid on;
pi1=1.01*pi*ones(1,39000);
pi2=0.99*pi*ones(1,39000);
plot(a,pi1,'r');
plot(a,pi2,'r');
ylabel('Estimated Value of Pi')
xlabel('Number of Samples')
 
%the program for the problem 2:
N=input('please enter the number of repetitions: '); %enter the number of trials, which is N
p=0;  
for i=1:N                     %repeat following process for N times
    j=1;
    a=randi(N,[1,N]);       %generate N discrete random variables from uniform distribution, each of which can take one of positive integer values from interval [1,N]
    while (j<=N)             %judge whether number 1 can be seen in each trial 
        if (a(1,j)==1)
            break;
        end
        j=j+1;
    end
    if (j==N+1)
        p=p+1;
    else
        p=p+0;
    end
end
k=p/N                      %compute the probability for a card being selected 0 times in N selections

%the program for the problem 3:
N=input('please enter the number of sample of y: '); %enter the number of sample of y, which is N 
a=rand([1,N]);         %generate N samples of y
p=0;
q=0;
for i=1:N               %generate N samples of g(y)
    g(1,i)=sin(pi*a(1,i))/a(1,i);
end
for i=1:N              %compute the sum of these samples of g(y)
   p=p+g(1,i);
end
k=p/N;                  %compute the sample mean of these g(y), which is approximately true value of the integral when N is large enough
for i=1:N
    q=q+(g(1,i)-k)^2;
end
s1=q/(N-1);
s2=s1/N;
syms x                   
r=int(sin(x)/x,x,0,pi);   %compute the true value of the integral
min=vpa(r)-1.96*s2^(0.5)  %compute the 95% confidence interval for this trial
max=vpa(r)+1.96*s2^(0.5)
