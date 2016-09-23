accessing
signalNodeCreationWarning
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: 'Unable to determine what should be returned from the production. ';
		nextPutAll:
			(index > 0
				ifTrue: [ 'A default item has been chosen, and all other ' ]
				ifFalse: [ 'All ' ]);
		nextPutAll: 'values will be dropped from the AST:';
		cr;
		cr;
		nextPutAll: rhs productionSymbol name;
		nextPutAll: ' : '.
	1 to: rhs size do:
		[ :i | 
		i == index
			ifTrue: [ stream nextPutAll: '>>>' ].
		stream nextPutAll: (rhs at: i) name.
		i == index
			ifTrue: [ stream nextPutAll: '<<<' ].
		stream space ].
	SmaCCCompilationNotification new
		messageText: 'Node creation';
		tag: stream contents;
		signal