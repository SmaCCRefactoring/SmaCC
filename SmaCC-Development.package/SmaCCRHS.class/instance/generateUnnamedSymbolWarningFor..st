reduce actions
generateUnnamedSymbolWarningFor: problemIndex
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll:
			'Unnamed symbol in production. Without a variable name the value will be dropped from the parsed AST.';
		cr;
		cr;
		nextPutAll: self productionSymbol name;
		nextPutAll: ' : '.
	1 to: self size do:
		[ :i | 
		i == problemIndex
			ifTrue: [ stream nextPutAll: '>>>' ].
		stream nextPutAll: (self at: i) name.
		i == problemIndex
			ifTrue: [ stream nextPutAll: '<<<' ].
		stream space ].
	SmaCCCompilationNotification new
		messageText: 'Node creation';
		tag: stream contents;
		signal