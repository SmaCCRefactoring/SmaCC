*smacc-rewrite-engine-ui
addLocal
	| variable |
	variable := UITheme builder textEntry: 'Enter variable name:' title: 'Variable' entryText: ''.
	(variable notNil and: [ RBScanner isVariable: variable ])
		ifTrue: [ self addLocal: variable ]