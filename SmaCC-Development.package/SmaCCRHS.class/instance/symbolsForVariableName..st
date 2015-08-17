accessing
symbolsForVariableName: aString
	| indices |
	indices := variableNameMap at: aString ifAbsent: [ #() ].
	^ indices collect: [ :i | self at: i ]