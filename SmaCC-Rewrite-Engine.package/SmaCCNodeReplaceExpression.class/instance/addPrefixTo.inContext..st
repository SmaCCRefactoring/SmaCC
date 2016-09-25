private
addPrefixTo: aSmaCCString inContext: aSmaCCRewriteMatchContext
	| node startPosition |
	node := aSmaCCRewriteMatchContext nodeFor: name value.
	startPosition := aSmaCCRewriteMatchContext
		originalStartPosition: node.
	prefix notNil
		ifTrue: [ aSmaCCString addPrefix: prefix value ].
	(aSmaCCRewriteMatchContext isAtStartOfParent: node)
		ifTrue: [ ^ self ].
	beforePrefix notNil
		ifTrue:
			[ (aSmaCCRewriteMatchContext
				charactersAtAndBefore: (aSmaCCRewriteMatchContext previousIndex: startPosition)
				matchesToken: beforePrefix)
				ifTrue:
					[ beforePrefix value size
						timesRepeat:
							[ startPosition := aSmaCCRewriteMatchContext
								previousIndex: startPosition ] ].
			aSmaCCString addPrefix: beforePrefix value ].
	beforeWhitespace notNil
		ifTrue:
			[ aSmaCCString
				addPrefix: (aSmaCCRewriteMatchContext whitespaceBefore: startPosition) ]