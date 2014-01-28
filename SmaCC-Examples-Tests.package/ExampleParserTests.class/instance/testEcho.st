testing-c
testEcho
	CParser parse: 'int main(int argc, char *argv[]) {
	int i;
	for (i = 0; i < argc; i++) {
		printf("%s", argv[i]);
	}
}'