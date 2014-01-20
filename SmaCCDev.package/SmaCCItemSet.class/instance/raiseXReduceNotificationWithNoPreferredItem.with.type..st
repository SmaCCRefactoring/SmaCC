accessing
raiseXReduceNotificationWithNoPreferredItem: firstSmaCCLR1Item with: secondSmaCCLR1Item type: aString 
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: firstSmaCCLR1Item printString;
		cr;
		nextPutAll: secondSmaCCLR1Item printString.
	SmaCCCompilationNotification new
		tag: stream contents;
		signal: aString