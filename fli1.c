#include<stdio.h>
#include<math.h>

double fli(double* U, int N, double h, double p){
	for (int k = 0; k < 1000; k++){
		U[0,0]=(2*U[1,2]+2*U[1,0])/4;
		for (int i = 1; i < N-1; k++){
			U[0,i]=(U[0,i+1]+U[0,i-1]+2*U[1,i]-pow(h,2)*(-2*pow(((i-1)*h),2)))/4; 
			U[N,i]=(U[N,i+1]+U[N,i-1]+2*U[N-1,i]-6*p*pow(((i-1)*h),2)-pow(h,2)*(-2*pow(((i-1)*h),2)+pow((N*p),2)))/(4+2*p);
		}
		U[N,0]=(2*U[N,1]+2*U[N-1,0]-pow(h,2)*(-2*pow((N*p),2)))/(4+2*p);
		for (j = 1; j < N-1; j++){
			U[j,0]=(2*U[j,1]+U[j+1,0]+U[j-1,0]-pow(h,2)*(-2*pow(((j-1)*p),2)))/4;
		}
		for (i = 1; i < N-1; i++){
			for (j = 1; j < N-1; j++){
				U[j,i]=(U[j,i+1]+U[j,i-1]+U[j+1,i]+U[j-1,i]-pow(h,2)*(-2*(pow(((i-1)*h),2)+pow(((j-1)*p),2))))/4;
			}
		}
	}
	return 1.0;
}

