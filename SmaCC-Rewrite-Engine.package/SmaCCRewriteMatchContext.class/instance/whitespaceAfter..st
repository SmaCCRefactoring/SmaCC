accessing
whitespaceAfter: anObject
	^ self originalSource
		whitespaceAfterIndex: (self stopIndexFor: anObject)