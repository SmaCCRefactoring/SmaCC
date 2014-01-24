compiling-scanner
compileEmptySymbolTokenId
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'emptySymbolTokenId';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: SmaCCSymbol empty) printString.
	self scannerClass compile: stream contents classified: #'generated-tokens'