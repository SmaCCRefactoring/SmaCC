printing
printOn: aStream 
	nodes do: [:each | each printOn: aStream] separatedBy: [aStream space]