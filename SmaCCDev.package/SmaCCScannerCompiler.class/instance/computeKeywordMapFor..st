regular expression construction
computeKeywordMapFor: dfa 
	| keywordmap |
	keywordmap := Dictionary new.
	self specificRegularExpressionsDo: 
			[:each | 
			| actions |
			actions := dfa actionForSpecificRegularExpression: each.
			actions isNil 
				ifFalse: 
					[self 
						addActionsFrom: each
						to: keywordmap
						at: actions]].
	^keywordmap