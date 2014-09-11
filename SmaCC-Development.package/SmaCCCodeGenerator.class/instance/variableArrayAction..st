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
					value isNode
						ifTrue: [ self error: 'Incorrect AST specification'	"self pullUpNodeVariablesFrom: value into: aSmaCCRHS index: key" ]
						ifFalse: [ self pullUpVariablesFrom: value into: aSmaCCRHS index: key ] ]
				ifFalse: [ self assignVariable: variableName in: aSmaCCRHS at: key ] ].
	self nextPutStatement: (self return: 'result').
	self nextPutLine: ''.
	^ self codeStream contents