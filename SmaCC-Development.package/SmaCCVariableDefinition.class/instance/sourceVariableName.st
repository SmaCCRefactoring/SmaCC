accessing
sourceVariableName
	^ self isCollection
		ifTrue: [ self class pluralNameFor: variableName ]
		ifFalse: [ variableName ]