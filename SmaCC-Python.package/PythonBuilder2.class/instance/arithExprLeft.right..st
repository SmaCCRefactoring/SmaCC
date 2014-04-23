building
arithExprLeft: aCollection right: aCollection2
	self assert: aCollection size = 2.
	self assert: aCollection second isNil.
	^ Array streamContents: [ :stream |
		stream nextPut: aCollection first.
		aCollection2 do: [ :operatorAndOperand | stream nextPut: operatorAndOperand first value; nextPut: operatorAndOperand second ] ]