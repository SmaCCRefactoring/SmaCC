printing
printOn: s
	s nextPutAll: start printString.
	s
		nextPutAll: ': ';
		nextPutAll: value;
		nextPutAll: ' ('.
	ids do: [ :e | s nextPutAll: e ] separatedBy: [ s nextPutAll: ', ' ].
	s nextPut: $)