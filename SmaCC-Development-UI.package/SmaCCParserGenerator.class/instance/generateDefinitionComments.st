accessing
generateDefinitionComments
	generateDefinitionComments isNil
		ifTrue: [ generateDefinitionComments := true ].
	^ generateDefinitionComments