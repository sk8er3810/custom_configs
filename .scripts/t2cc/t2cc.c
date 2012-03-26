/**
 * Written by, Ilya Sukhanov aka dotCOMmie in 2008
 * No rights reserved. Public domain code.
 *
 * INSTALL
 * 		$ mkdir ~/.bash
 * 		$ gcc t2cc.c -o ~/.bash/t2cc
 *
 * 		copy line below to ~/.bashrc
 *			t2cc="~/.bash/t2cc"
 *			PS1="\[\e[`$t2cc $HOSTNAME`m\]\u@\h\[\e[0m\]:\[\e[`$t2cc $HOSTNAME -2`m\]\w\[\e[0m\]\$ "
 *
 * 		If you are using a terminal with bright background add the -b flag
 *		
 **/

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[] ){
	char *tmp;
	long sum=0;
	int len, i;
	int bright=0, backward=0;
	if(argc >= 2 && argc<=4 ){
		if(argc >= 3){
			if(strcmp(argv[2],"-2")==0) backward=1;
			if(strcmp(argv[2],"-b")==0) bright=1;
			if(argc >= 4){
				if(strcmp(argv[3],"-2")==0) backward=1;
				if(strcmp(argv[3],"-b")==0) bright=1;
			}
		}

		len=strlen(argv[1]);
		if(!backward){
			tmp=argv[1];
			for(i=0; i<len; i++){
				sum+=(i+1)*(*tmp);
				*tmp++;
			}
		}else{
			tmp=argv[1]+len-1;
			for(i=0; i<len; i++){
				sum+=(i+1)*(*tmp);
				*tmp--;
			}
		
		}

		if(!bright){
			sum=sum%13;
			if(sum<=3)
				printf("%i", 31+sum);
			else if(sum<=5)
				printf("%i", 32+sum);
			else
				printf("1;%i", 24+sum);
		}else{
			sum=sum%11;
			if(sum<=7)
				printf("%i", 30+sum);
			else if(sum<9)
				printf("1;%i", 25+sum);
			else
				printf("1;%i", 27+sum);
		}
	}else{
		printf("Usage: %s STRING [-b] [-2]\n\t-b\tUse colors compatible with bright backgrounds.\n\t-2\tReturn a color based on a backwards hash.\n", argv[0]);
	}
}

