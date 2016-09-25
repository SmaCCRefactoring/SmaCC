public
openFile: aString
	^ [ FileStream readOnlyFileNamed: aString ]
		on: Error
		do: [ :ex | self exitFailure ]