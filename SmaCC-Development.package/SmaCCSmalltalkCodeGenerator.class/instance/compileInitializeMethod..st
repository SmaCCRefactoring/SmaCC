compiling
compileInitializeMethod: aSmaCCNodeClassDefinition
	| stream |
	((aSmaCCNodeClassDefinition modelClass definesMethod: #initialize)
		and: [ aSmaCCNodeClassDefinition collectionVariableDefinitions isEmpty ])
		ifTrue: [ ^ self ].
	stream := WriteStream on: String new.
	stream nextPutAll: 'initialize'.
	(aSmaCCNodeClassDefinition modelClass superclass
		definesMethod: #initialize)
		ifTrue: [ stream
				cr;
				tab;
				nextPutAll: 'super initialize.' ].
	aSmaCCNodeClassDefinition collectionVariableDefinitions
		do:
			[ :each | 
			stream
				cr;
				tab;
				nextPutAll: (self nonKeywordNameFor: each sourceVariableName);
				nextPutAll: ' := OrderedCollection new: 2.' ].
	aSmaCCNodeClassDefinition modelClass
		compile: stream contents
		classified: #'generated-initialize-release'