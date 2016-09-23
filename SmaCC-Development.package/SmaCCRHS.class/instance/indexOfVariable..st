variables
indexOfVariable: aString
	^ (variableNameMap at: aString ifAbsent: [ ^ nil ]) first