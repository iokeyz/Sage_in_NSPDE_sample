import numpy as np
import time
l=2;h=0.01;N=l/h;T=1.5;a=2;
p=0.03;M=T/p;r=a*p/h;
U=np.zeros((M+1,N+1));
for j in range(0,N+1):
    U[0,j]=np.exp(j*h);
for i in range(0,M+1):
    U[i,0]=np.exp(-2*i*p);
sttime = time.time();
for k in range(1,M+1):
    for j in range(1,N+1):
        U[k,j]=(1-r)*U[k-1,j]+r*U[k-1,j-1];
print(time.time()-sttime)
U1=np.array([U[M,2],U[M,5],U[M,10],U[M,15],U[M,20]]);
u=np.array([np.exp(0.2-2*1.5),np.exp(0.5-2*1.5),np.exp(1.0-2*1.5),np.exp(1.5-2*1.5),np.exp(2.0-2*1.5)]);
e=np.abs(u-U1);
print(e)
