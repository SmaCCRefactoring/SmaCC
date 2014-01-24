compiling
compilePluralVariableMap: allVariables into: aSmaCCNodeClassDefinition
	| stream |
	allVariables isEmpty
		ifTrue: [ ^ self ].
	(allVariables anySatisfy: [ :each | aSmaCCNodeClassDefinition isLocalVariable: each ])
		ifFalse: [ ^ self ].
	stream := WriteStream on: String new.
	stream
		nextPutAll:
				(self supportsOptimizedExpressions
						ifTrue: [ '##(' ]
						ifFalse: [ '[' ]);
		nextPutAll: '(Dictionary new) '.
	allVariables
		do: [ :each | 
			stream
				nextPutAll: 'at: ''';
				nextPutAll: each variableName;
				nextPutAll: ''' put: ''';
				nextPutAll: each sourceVariableName;
				nextPutAll: '''; ' ].
	stream
		nextPutAll: 'yourself';
		nextPutAll:
				(self supportsOptimizedExpressions
						ifTrue: [ ')' ]
						ifFalse: [ '] once' ]).
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'pluralVariablesMap' type: self collectionType);
		nextPutStatement: (self return: stream contents);
		endMethod;
		compileMethodIn: aSmaCCNodeClassDefinition modelClass