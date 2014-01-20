compiling-scanner
compileTokenIdMethodFor: aTerminalSymbol 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: aTerminalSymbol safeMethodName;
		nextPutAll: 'Id';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: (self symbols indexOf: aTerminalSymbol) printString.
	scannerClass compile: stream contents classified: #'generated-tokens'