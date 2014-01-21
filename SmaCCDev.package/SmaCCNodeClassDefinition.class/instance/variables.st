accessing
variables
	^superclass isNil
		ifTrue: [self instanceVariableNames copy]
		ifFalse:
			[(superclass variables)
				addAll: self instanceVariableNames;
				yourself]