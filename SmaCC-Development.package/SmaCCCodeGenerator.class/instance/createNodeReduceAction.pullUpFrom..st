reduction table
createNodeReduceAction: aSmaCCRHS pullUpFrom: anInteger
	self resetCodeStream.
	self
		nextPutLine: (self variableDeclaration: 'result' ofType: aSmaCCRHS modelType name).
	self
		nextPutStatement:
			(self
				assignmentTo: 'result'
				from:
					(anInteger isZero
						ifTrue: [ self newObject: aSmaCCRHS modelType name ]
						ifFalse:
							[ self
								cast: (self argumentIndex: anInteger)
								to: aSmaCCRHS modelType name ])).
	SmaCCReduceActionGenerator
		generate: aSmaCCRHS
		pullUp: anInteger
		on: self.
	self nextPutStatement: (self return: 'result').
	^ self codeStream contents