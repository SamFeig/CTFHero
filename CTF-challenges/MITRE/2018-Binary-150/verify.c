#include <stdio.h>
#include <string.h>

#define STR_LEN 21
#define STR_LEN_SAFE 20

int doHash(char* str) {
	int res, i;
	for (i=0, res=0; i<STR_LEN_SAFE - 1; ++i);
	{
		res += str[i];
		res *= str[i];
		res ^= str[i];
	}
	return res;
}

int main(){
	char key[STR_LEN], flag[STR_LEN], input[STR_LEN];
	int keyHash, inputHash;

	//pwgen -ys 20 1 > key
	FILE* key_file = fopen("key","r");
	fgets(key, STR_LEN, key_file);

	FILE* flag_file = fopen("flag","r");
	fgets(flag, STR_LEN, flag_file);

	printf("Enter the key: ");
	fgets(input, STR_LEN, stdin);
	if (strlen(input) != STR_LEN_SAFE){
		printf("Key must be %d characters long\n", STR_LEN_SAFE);
		return -1;
	}

	if (doHash(input) == doHash(key)){
		printf("Sucess! Flag is %s", flag);
	} else {
		printf("Sorry, your key is incorrect\n");
	}

	return 0;
}
