source editing
move: anObject replacing: anotherObject withWhitespace: aString
	| oldStop |
	oldStop := self stopIndexFor: anotherObject.
	self move: anObject after: anotherObject withWhitespace: aString.
	self deleteFrom: (self startIndexFor: anotherObject) to: oldStop.
	^ self startIndexFor: anObject