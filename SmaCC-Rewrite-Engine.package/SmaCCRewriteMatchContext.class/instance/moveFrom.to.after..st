source editing
moveFrom: startIndex to: stopIndex after: anObject
	^ self source
		moveFrom: (self startIndexFor: startIndex)
		to: (self stopIndexFor: stopIndex)
		after: (self startIndexFor: anObject)