private
replaceFrom: startIndex to: stopIndex with: aString
	self insert: aString before: startIndex.
	self deleteFrom: startIndex to: stopIndex