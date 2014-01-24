printing
printPathOn: aStream
	self lr1Item path do: [:each | aStream nextPutAll: each name] separatedBy: [aStream space]