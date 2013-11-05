#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
 	int kombLen = atoi(argv[1]);
	if (kombLen < 1) 
		exit(1);

    char *buffer = NULL;
    int read;
    unsigned int len;
    read = getline(&buffer, &len, stdin);

 	int i;
	for (i=0; i < read-kombLen; i++) {
		printf("%.*s\n", kombLen, buffer + i);
    }
     
    free(buffer);
	return 0;
}


