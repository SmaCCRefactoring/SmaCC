reduction table
singleVariableCollectionFor: reduceCode
	| variable recursionIndex |
	variable := reduceCode rhs productionSymbol variableDefinitions asArray first variableName.
	self resetCodeStream.
	recursionIndex := reduceCode indices
		detect:
			[:i | 
			| symbol |
			symbol := reduceCode rhs at: i.
			symbol isNode not and: [symbol isCollection: variable]]
		ifNone: [0].
	self nextPutLine: (self variableDeclaration: 'result' ofType: self arrayType).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from:
					(recursionIndex = 0
						ifTrue: [self newCollectionOfSize: 2]
						ifFalse: [self cast: (self argumentIndex: recursionIndex) to: self collectionType])).
	reduceCode indices
		do:
			[:i | 
			i = recursionIndex
				ifFalse:
					[| symbol |
					symbol := reduceCode rhs at: i.
					self
						nextPutStatement:
							((symbol isNode not and: [symbol isCollection: variable])
								ifTrue:
									[self
										perform: (recursionIndex > i ifTrue: [#addAllFirstSendTo:with:] ifFalse: [#addAllSendTo:with:])
										with: 'result'
										with: (self argumentIndex: i)]
								ifFalse:
									[self
										perform: (recursionIndex > i ifTrue: [#addFirstSendTo:with:] ifFalse: [#addSendTo:with:])
										with: 'result'
										with: (self argumentIndex: i)])]].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^self codeStream contents