compiling
compileTransitionTable
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'transitionTable';
		cr;
		tab;
		nextPutAll: '^#(';
		cr.
	self transitionTable do: 
			[:each | 
			stream 
				nextPutAll: (self hasLiteralByteArrays ifTrue: ['#['] ifFalse: ['#(']).
			each do: [:byte | stream nextPutAll: byte printString]
				separatedBy: [stream nextPut: $ ].
			stream
				nextPut: (self hasLiteralByteArrays ifTrue: [$]] ifFalse: [$)]);
				cr].
	stream nextPut: $).
	parserClass compile: stream contents classified: #'generated-tables'