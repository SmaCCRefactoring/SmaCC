private
performParsingLoop
	| result |
	self setStartingStatesIfNone.
	[ states size to: 1 by: -1 do:
		[ :i | 
		self restoreState: (states at: i).
		self getNextToken.
		errorToken := nil.
		self performParsingStep ].
	self mergeStates.
	states anySatisfy: [ :each | each isAccepted not ] ] whileTrue.
	self checkForErrors.
	result := parseAll
		ifTrue: [ states
				collect: [ :each | self fixObject: each nodeStack first ] ]
		ifFalse: [ self fixObject: states first nodeStack first ].
	nodeStack := OrderedCollection with: result