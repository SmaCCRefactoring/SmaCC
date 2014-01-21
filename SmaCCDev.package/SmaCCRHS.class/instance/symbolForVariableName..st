accessing
symbolForVariableName: aString
	| index |
	index := self indexOfVariable: aString.
	index isNil ifTrue: [^nil].
	^self at: index