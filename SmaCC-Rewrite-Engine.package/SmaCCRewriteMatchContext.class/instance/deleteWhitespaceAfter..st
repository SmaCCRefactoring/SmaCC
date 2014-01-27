private
deleteWhitespaceAfter: anObject
	| anIndex |
	anIndex := self stopIndexFor: anObject.
	self source deleteWhitespaceAfterIndex: anIndex