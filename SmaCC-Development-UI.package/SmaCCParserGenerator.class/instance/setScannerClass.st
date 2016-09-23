actions
setScannerClass
	| name |
	name := UIManager default request: 'Enter scanner class name:' initialAnswer: self scannerClassName.
	(name isNil or: [ name isEmpty ])
		ifTrue: [ ^ self ].
	(self isValidName: name)
		ifFalse: [ ^ UIManager default inform: 'Invalid Class Name' ].
	self scannerClassName: name asSymbol