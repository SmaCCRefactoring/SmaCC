private
variableArrayAction: aSmaCCRHS
	"This is where the array based reduction code is generated. This code signify that the AST definition is probably wrong, so we will trigger an error instead of generating in the most obvious cases."

	self resetCodeStream.
	self createVariableArrayFor: aSmaCCRHS.
	aSmaCCRHS collection
		keysAndValuesDo: [ :key :value | 
			| variableName |
			variableName := aSmaCCRHS variableNameForIndex: key.
			variableName isNil
				ifTrue: [ 
					value returnsVariableCollection
						ifTrue: [ self pullUpVariablesFrom: value into: aSmaCCRHS index: key ]
						ifFalse: [ 
							value modelType = (self model classFor: nil class)
								ifFalse: [ aSmaCCRHS generateUnnamedSymbolWarningFor: key ] ] ]
				ifFalse: [ 
					value returnsVariableCollection
						ifTrue: [ aSmaCCRHS generateNamedVariableCollectionWarningFor: key ].
					self assignVariable: variableName in: aSmaCCRHS at: key ] ].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^ self codeStream contents