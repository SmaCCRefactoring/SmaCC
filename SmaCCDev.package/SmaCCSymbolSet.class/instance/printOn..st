printing
printOn: aStream 
	symbols do: [:each | aStream nextPutAll: each printString]
		separatedBy: [aStream space]