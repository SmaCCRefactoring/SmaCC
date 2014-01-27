private
moveFrom: startIndex to: stopIndex before: anObject
	^self source
		moveFrom: (self startIndexFor: startIndex)
		to: (self stopIndexFor: stopIndex)
		before: (self startIndexFor: anObject)