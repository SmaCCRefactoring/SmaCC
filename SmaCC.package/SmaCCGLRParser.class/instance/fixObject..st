private
fixObject: anObject
	| result |
	result := anObject performOnSmaCCParser: self.
	(result isKindOf: SmaCCParseNode) ifTrue: [result fixParentPointers].
	^result