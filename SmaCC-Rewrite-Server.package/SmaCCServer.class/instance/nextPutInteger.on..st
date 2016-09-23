running
nextPutInteger: anInteger on: aStream
	| value |
	value := anInteger.
	4
		timesRepeat: [ 
			aStream nextPut: (value bitAnd: 16rFF).
			value := value bitShift: -8 ]