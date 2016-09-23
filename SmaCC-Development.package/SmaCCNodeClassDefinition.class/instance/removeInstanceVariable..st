private-variables
removeInstanceVariable: aString
	| variable |
	variable := self variableDefinitions
		detect: [ :each | each variableName = aString ]
		ifNone: [ nil ].
	variable isNil
		ifTrue: [ ^ self ].
	variables remove: variable.
	SmaCCVariableDefinition assignIndices: variables