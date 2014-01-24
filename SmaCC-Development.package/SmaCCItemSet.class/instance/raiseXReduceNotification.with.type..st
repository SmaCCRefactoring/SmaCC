accessing
raiseXReduceNotification: preferredSmaCCLR1Item with: otherSmaCCLR1Item type: aString 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: preferredSmaCCLR1Item printString;
		nextPutAll: '	*****';
		cr;
		nextPutAll: otherSmaCCLR1Item printString.
	SmaCCCompilationNotification new
		tag: stream contents;
		signal: aString