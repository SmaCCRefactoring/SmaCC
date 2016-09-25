editing
replaceFrom: startIndex to: stopIndex with: aString
	| newIndex |
	newIndex := self insert: aString at: startIndex.
	self deleteFrom: startIndex to: stopIndex.
	^ newIndex