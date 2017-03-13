import numpy as np
import time as tm
from ctypes import *
h=1/10;p=1/10;N=10;
def f(x,y):
	return (-x**2)*(y**2);
U=np.zeros((N+1,N+1),dtype=float);
for j in range(0,N):
    U[j,N] = -((j-1)*p)**2;

nowtime = tm.time();
my_loop = CDLL('/home/sage/Code/fli1.so');
N_c = c_int(int(10));h_c = c_double(float(1/10)); p_c = c_double(float(1/10));
cr = my_loop.fli(U.ctypes.data_as(c_void_p), N_c, h_c, p_c);
print(tm.time()-nowtime);

U1=np.array([U[0,0],U[5,0],U[10,0],U[0,5],U[5,5],U[10,5],U[5,9]]);
for i in range(0,7):
    print(U1[i]);
u =np.array([f(0,0),f(0,0.5),f(0,1),f(0.5,0),f(0.5,0.5),f(0.5,1),f(0.9,0.5)]);
for i in range(0,7):
    print(u[i]);
e = u-U1;
print(e);