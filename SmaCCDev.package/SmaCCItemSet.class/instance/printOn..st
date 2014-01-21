printing
printOn: aStream
	| strings |
	strings := OrderedCollection new: self size.
	self do: [:each | strings add: each printString].
	strings asSortedCollection
		do:
			[:each | 
			aStream
				tab;
				nextPutAll: each;
				cr]