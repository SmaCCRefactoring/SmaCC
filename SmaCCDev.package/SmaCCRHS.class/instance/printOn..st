printing
printOn: aStream
	^collection do: [:each | each printOn: aStream] separatedBy: [aStream space]