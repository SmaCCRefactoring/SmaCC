printing
putOn: aStream
	nodes
		do: [ :each | each printOn: aStream ]