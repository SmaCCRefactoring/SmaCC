reduce actions
generateNamedVariableCollectionWarningFor: problemIndex
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll:
				'Non terminal symbol that returns a variable collection is assigned to a variable. The non terminal should be changed to return an AST node:';
		cr;
		cr;
		nextPutAll: self productionSymbol name;
		nextPutAll: ' : '.
	1 to: self size do: [ :i | 
		i == problemIndex
			ifTrue: [ stream nextPutAll: '>>>' ].
		stream nextPutAll: (self at: i) name.
		i == problemIndex
			ifTrue: [ stream nextPutAll: '<<<' ].
		stream space ].
	SmaCCCompilationNotification signal: 'Node creation' with: stream contents