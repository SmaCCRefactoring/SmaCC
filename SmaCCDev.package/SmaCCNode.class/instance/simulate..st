private
simulate: aStream
	| char |
	aStream atEnd ifTrue: [^action].
	char := aStream next.
	transitions do: [:each | (each includes: char) ifTrue: [^each to simulate: aStream]].
	^nil