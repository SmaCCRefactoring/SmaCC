compiling-scanner
outputMatchFor: aSmaCCCharacterEdge on: stream without: isSelectors
	| pairs |
	pairs := self
		minMaxPairsFor: aSmaCCCharacterEdge
		without: isSelectors.
	pairs isEmpty
		ifTrue: [ stream next: isSelectors size - 1 put: $].
			^ self ].
	isSelectors notEmpty
		ifTrue: [ stream nextPutAll: ' or: [' ].
	pairs
		do: [ :each | self outputMatchForTransition: each on: stream ]
		separatedBy: [ stream nextPutAll: ' or: [' ].
	stream next: pairs size - 1 put: $].
	stream next: isSelectors size put: $]