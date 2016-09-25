private
addPostfixTo: aSmaCCString inContext: aSmaCCRewriteMatchContext
	| node position string |
	node := aSmaCCRewriteMatchContext nodeFor: name value.
	(aSmaCCRewriteMatchContext isAtEndOfParent: node)
		ifFalse:
			[ position := aSmaCCRewriteMatchContext originalStopPosition: node.
			string := nil.
			afterPostfix notNil
				ifTrue:
					[ (aSmaCCRewriteMatchContext
						charactersAtAndAfter: (aSmaCCRewriteMatchContext nextIndex: position)
						matchesToken: afterPostfix)
						ifTrue:
							[ afterPostfix value size
								timesRepeat: [ position := aSmaCCRewriteMatchContext nextIndex: position ] ].
					string := afterPostfix value ].
			afterWhitespace notNil
				ifTrue:
					[ aSmaCCString
						addPrefix: (aSmaCCRewriteMatchContext whitespaceAfter: position) ].
			string notNil
				ifTrue: [ aSmaCCString addPrefix: string ] ].
	postfix notNil
		ifTrue: [ aSmaCCString addPrefix: postfix value ]