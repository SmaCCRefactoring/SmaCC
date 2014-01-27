public
performOn: aSmaCCNode continuation: aBlock
	| link |
	link := cachedLists
		at: aSmaCCNode class
		ifAbsentPut:
			[| first |
			first := SmaCCRewriteLink new.
			self listForClass: aSmaCCNode class into: first.
			first next].
	^self performLink: link on: aSmaCCNode continuation: aBlock