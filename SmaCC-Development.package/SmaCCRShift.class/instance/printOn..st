printing
printOn: aStream
	aStream
		nextPutAll:
			'<' , ((state << 2) + 2r01) printString , ':Shift on: '
				, self printSymbol , ' to: ' , state printString , '>'