import numpy as np
import time
starttime = time.time();
N=20;M=25;h=4/N;p=1/M;a=4/np.pi**2;r=a*p/h**2;U=np.zeros((M+1,N+1));
for j in range(0,N+1):
    U[0,j]=np.sin(j*h*np.pi/2)+np.sin(j*h*np.pi/4);
for k in range(0,M+1):
    U[k,0]=0;
    U[k,N]=0;
for j in range(1,N):
    if((j+1)%2==0):
        U[1,j]=r*U[0,j-1]+(1-2*r)*U[0,j]+r*U[0,j+1];

for k in range(2,M+1):
    for j in range(1,N):
        if((j+k)%2==0):
            U[k,j]=r*U[k-1,j-1]+r*U[k-1,j+1]+((1-2*r)/(1+2*r))*(r*U[k-1,j-1]+r*U[k-1,j+1]+U[k-2,j]);  
startime = time.time();       
for k in range(1,M+1):
    for j in range(1,N):
         if((j+k)%2!=0):
            U[k,j]=(1/(1+2*r))*(r*U[k,j-1]+r*U[k,j+1]+U[k-1,j]);
print(time.time()-startime) 
U1 = E = np.zeros(N+1);
for j in range(0,N):
    U1[j]=np.exp(-1)*np.sin(j*h*np.pi/2)+np.exp(-1/4)*np.sin(j*h*np.pi/4);
    E[j]=U1[j]-U[M,j];
e=max(abs(E))
print(time.time()-starttime) 
print(e)
