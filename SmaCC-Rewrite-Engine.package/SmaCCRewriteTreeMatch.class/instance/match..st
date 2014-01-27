matching
match: aSmaCCRewriteMatchContext
	| context |
	1
		to: self trees size
		do:
			[:i | 
			context := Dictionary new.
			((trees at: i) match: aSmaCCRewriteMatchContext match inContext: context) ifTrue: [^context]].
	^nil