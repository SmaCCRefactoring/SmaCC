initialize
on: aReadStream 
	sourceStream := aReadStream.
	eolPositions := OrderedCollection with: aReadStream position.
	lastPosition := aReadStream position.
	previousWasCR := false