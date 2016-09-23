activation
runFile: aString
	| model |
	model := SmaCCTransformationToolkitModel new.
	[ model loadFile: aString ]
		on: Error
		do: [ :ex | ^ self exitFailure: 'Unable to load file: ' , aString ].
	self run: model