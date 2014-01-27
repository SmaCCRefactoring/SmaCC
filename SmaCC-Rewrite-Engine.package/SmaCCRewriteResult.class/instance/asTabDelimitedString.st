converting
asTabDelimitedString
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: filename;
		tab;
		nextPutAll: (errorString ifNil: ['']);
		tab;
		nextPutAll: (type ifNil: ['']);
		tab;
		nextPutAll: (startLine ifNil: [''] ifNotNil: [:value | value printString]);
		tab;
		nextPutAll: (startColumn ifNil: [''] ifNotNil: [:value | value printString]);
		tab;
		nextPutAll: (transformation ifNil: [''] ifNotNil: [:value | value displayString]).
	^stream contents