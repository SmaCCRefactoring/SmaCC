actions
updateTitle
	| scannerLabel parserLabel |
	scannerLabel := self scannerClassString isEmpty
		ifFalse: [ self scannerClassString ]
		ifTrue: [ 'Undefined' ].
	parserLabel := self parserClassString isEmpty
		ifFalse: [ self parserClassString ]
		ifTrue: [ 'Undefined' ].
	^ self mainWindow
		setLabel: 'SmaCCParserGenerator: ' , scannerLabel , '/' , parserLabel