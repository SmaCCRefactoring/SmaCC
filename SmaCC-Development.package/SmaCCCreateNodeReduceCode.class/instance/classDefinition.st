accessing
classDefinition
	classDefinition isNil
		ifTrue: [ classDefinition := rhs nodeClassDefinition
				ifNil: [ rhs nodeType ] ].
	^ classDefinition