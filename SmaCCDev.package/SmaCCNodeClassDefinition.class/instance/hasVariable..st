private
hasVariable: aString
	^(variables anySatisfy: [:each | each variableName = aString])
		or: [superclass notNil and: [superclass hasVariable: aString]]