private
singleVariableCollectionFor: reduceCode
	| variable |
	variable := reduceCode rhs productionSymbol variableDefinitions asArray first variableName.
	self resetCodeStream.
	self nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self nextPutStatement: (self assignmentTo: 'result' from: (self newCollectionOfSize: 2)).
	reduceCode indices
		do: [ :i | 
			| symbol |
			symbol := reduceCode rhs at: i.
			self
				nextPutStatement:
					((symbol isNode not and: [ symbol isCollection: variable ])
						ifTrue: [ self addAllSendTo: 'result' with: (self argumentIndex: i) ]
						ifFalse: [ self addSendTo: 'result' with: (self argumentIndex: i) ]) ].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^ self codeStream contents