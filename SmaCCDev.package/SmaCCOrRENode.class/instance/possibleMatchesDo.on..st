private
possibleMatchesDo: aBlock on: aStream
	nodes
		do:
			[:each | 
			| pos |
			pos := aStream position.
			each possibleMatchesDo: aBlock on: aStream.
			aStream position: pos]