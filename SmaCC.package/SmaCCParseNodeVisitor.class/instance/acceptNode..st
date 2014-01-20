private
acceptNode: aSmaCCParseNode
	aSmaCCParseNode isNil ifTrue: [^nil].
	^aSmaCCParseNode acceptVisitor: self