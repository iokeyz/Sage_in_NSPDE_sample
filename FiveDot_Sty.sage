import numpy as np
import time
h=1/10;p=1/10;N=10;
nowtime = time.time();
def f(x,y):
	return (-x**2)*(y**2);
print(time.time()-nowtime);
U=zeros((N+1,N+1));
for j in range(0,N):
    U[j,N] = -((j-1)*p)**2;
alltime = nowtime=time.time();
for k in range(1,1000):
    U[0,0]=(2*U[1,2]+2*U[1,0])/4;
    for i in range(1,N-1):
        U[0,i]=(U[0,i+1]+U[0,i-1]+2*U[1,i]-h**2*(-2*((i-1)*h)**2))/4; 
        U[N,i]=(U[N,i+1]+U[N,i-1]+2*U[N-1,i]-6*p*((i-1)*h)**2-h**2*(-2*(((i-1)*h)**2+(N*p)**2)))/(4+2*p);
    U[N,0]=(2*U[N,1]+2*U[N-1,0]-h**2*(-2*(N*p)**2))/(4+2*p);
    for j in range(1,N-1):
        U[j,0]=(2*U[j,1]+U[j+1,0]+U[j-1,0]-h**2*(-2*((j-1)*p)**2))/4;
    notime = time.time();
    for i in range(1,N-1):
        for j in range(1,N-1):
            U[j,i]=(U[j,i+1]+U[j,i-1]+U[j+1,i]+U[j-1,i]-h**2*(-2*(((i-1)*h)**2+((j-1)*p)**2)))/4;
    alltime += (time.time()-notime);
print(time.time()-alltime);
print(time.time()-nowtime);
U1=np.array([U[0,0],U[5,0],U[10,0],U[0,5],U[5,5],U[10,5],U[5,9]]);
for i in range(0,7):
    print(U1[i]);
u =np.array([f(0,0),f(0,0.5),f(0,1),f(0.5,0),f(0.5,0.5),f(0.5,1),f(0.9,0.5)]);
for i in range(0,7):
    print(u[i]);
e = u-U1;
print(e);
