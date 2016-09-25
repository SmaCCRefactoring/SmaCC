compiling-scanner
outputMatchFor: aSmaCCCharacterEdge seen: aCollection on: stream
	| isSelectors |
	isSelectors := self
		closestIsExpressionsFor: aSmaCCCharacterEdge
		seen: aCollection.
	isSelectors
		do: [ :each | self outputIsSelector: each on: stream ]
		separatedBy: [ stream nextPutAll: ' or: [' ].
	self
		outputMatchFor: aSmaCCCharacterEdge
		on: stream
		without: isSelectors