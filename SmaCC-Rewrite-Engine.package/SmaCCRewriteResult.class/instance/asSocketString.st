converting
asSocketString
	| stream null |
	stream := WriteStream on: String new.
	null := Character value: 0.
	stream
		nextPutAll: 'FILENAME=';
		nextPutAll: filename;
		nextPut: null.
	errorString notNil
		ifTrue:
			[stream
				nextPutAll: 'ERRORSTRING=';
				nextPutAll: errorString;
				nextPut: null].
	type notNil
		ifTrue:
			[stream
				nextPutAll: 'TYPE=';
				nextPutAll: type;
				nextPut: null].
	startLine notNil
		ifTrue:
			[stream
				nextPutAll: 'STARTLINE=';
				print: startLine;
				nextPut: null].
	startColumn notNil
		ifTrue:
			[stream
				nextPutAll: 'STARTCOLUMN=';
				print: startColumn;
				nextPut: null].
	interval notNil
		ifTrue:
			[stream
				nextPutAll: 'INTERVAL=';
				print: interval start;
				nextPut: $-;
				print: interval stop;
				nextPut: null].
	transformation notNil
		ifTrue:
			[stream
				nextPutAll: 'TRANSFORMATION=';
				nextPutAll: transformation displayString;
				nextPut: null].
	^stream contents