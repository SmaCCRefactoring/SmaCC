compiling-scanner
compileErrorSymbolTokenId
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'errorTokenId';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: SmaCCSymbol error) printString.
	self scannerClass compile: stream contents classified: #'generated-tokens'