private
variableArrayAction: aSmaCCRHS
	self resetCodeStream.
	self createVariableArrayFor: aSmaCCRHS.
	aSmaCCRHS collection
		keysAndValuesDo:
			[:key :value | 
			| variableName |
			variableName := aSmaCCRHS variableNameForIndex: key.
			variableName isNil
				ifTrue:
					[value isNode
						ifTrue:
							[self
								pullUpNodeVariablesFrom: value
								into: aSmaCCRHS
								index: key]
						ifFalse:
							[self
								pullUpVariablesFrom: value
								into: aSmaCCRHS
								index: key]]
				ifFalse:
					[self
						assignVariable: variableName
						in: aSmaCCRHS
						at: key]].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^self codeStream contents