reduction table
variableArrayAction: aSmaCCRHS
	| recursionIndex |
	self resetCodeStream.
	recursionIndex := self recursionIndexFor: aSmaCCRHS.
	recursionIndex = 0
		ifTrue: [self createVariableArrayFor: aSmaCCRHS]
		ifFalse: [self pullUpVariableArrayFor: aSmaCCRHS index: recursionIndex].
	aSmaCCRHS collection keysAndValuesDo: 
			[:key :value |
			key = recursionIndex
				ifFalse: 
					[| variableName |
					variableName := aSmaCCRHS variableNameForIndex: key.
					variableName isNil
						ifTrue: 
							[value returnsVariableCollection
								ifTrue: 
									[self
										pullUpVariablesFrom: value
										into: aSmaCCRHS
										index: key
										first: recursionIndex > key]
								ifFalse: 
									[value returnsSingleVariable
										ifTrue: 
											[self
												pullUpVariableFrom: value
												into: aSmaCCRHS
												index: key
												first: recursionIndex > key]
										ifFalse: 
											[value modelType = (self model classFor: nil class)
												ifFalse: [aSmaCCRHS generateUnnamedSymbolWarningFor: key]]]]
						ifFalse: 
							[value returnsVariableCollection
								ifTrue: [aSmaCCRHS generateNamedVariableCollectionWarningFor: key].
							self
								assignVariable: variableName
								in: aSmaCCRHS
								at: key
								first: recursionIndex > key]]].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^self codeStream contents