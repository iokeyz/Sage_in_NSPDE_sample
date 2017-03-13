import numpy as np
import time
starttime = time.time();
N=40;h=np.pi/N;
t=1;p = 100;M=t/p;
a=1;U=np.zeros((M+1,N+1));
r=(a*p)/h**2;
for j in range(0,N):
    U[0,j]=np.sin(h*j);
for k in range(0,M):
    U[k,0]=0;
    U[k,N]=0;

for k in range(0,M):
    for j in range(1,N-1):
        U[k+1,j]=r*U[k,j-1]+(1-2*r)*U[k,j]+r*U[k,j+1];

U1 = E = np.zeros(N+1);
print(time.time()-starttime);
for j in range(0,N):
    U1[j]=np.exp(-1)*np.sin((j-1)*h);
    E[j]=abs(U1[j]-U[M,j]);
print(E);
