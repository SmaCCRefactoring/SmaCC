printing
printOn: aStream
	aStream
		nextPutAll:
			'<' , ((state << 2) + 2r10) printString , ':Reduce on: '
				, self printSymbol , ' pop: ' , self printNbElements
				, ' and goto (stack, ' , self printFollowUpSymbol , ' )'