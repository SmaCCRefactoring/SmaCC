private-variables
variableDefinitionNamed: aString
	^ self variableDefinitions
		detect: [ :each | each variableName = aString ]
		ifNone:
			[ superclass isNil
				ifTrue: [ nil ]
				ifFalse: [ superclass variableDefinitionNamed: aString ] ]