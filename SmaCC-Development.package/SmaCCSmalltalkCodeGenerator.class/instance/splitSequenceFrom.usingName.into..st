compiling-scanner
splitSequenceFrom: aParseTree usingName: aSelector into: modelClass
	| sequence statements |
	statements := aParseTree body copy statements.
	statements size <= 1
		ifTrue: [ ^ false ].
	sequence := RBSequenceNode statements: OrderedCollection new.
	[ (self countLiteralsIn: sequence) < self maxLiterals
		and: [ statements notEmpty ] ]
		whileTrue: [ sequence addNodeFirst: statements removeLast ].
	sequence removeNode: sequence statements first.
	sequence statements size <= 1
		ifTrue: [ ^ false ].
	sequence statements size
		timesRepeat: [ aParseTree body removeNode: aParseTree body statements last ].
	aParseTree body
		addNode:
			(RBReturnNode
				value:
					(RBMessageNode
						receiver: (RBVariableNode named: 'self')
						selector: aSelector)).
	self
		compileScannerTree: (RBMethodNode selector: aSelector body: sequence)
		into: modelClass.
	^ true