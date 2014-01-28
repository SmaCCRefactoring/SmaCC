printing
printOn: aStream
	(symbols asSortedCollection: [:a :b | a name < b name])
		do: [:each | aStream nextPutAll: each printString]
		separatedBy: [aStream space]