adding
add: aSmaCCLR1Item 
	| index item |
	aSmaCCLR1Item == nil ifTrue: [^aSmaCCLR1Item].
	index := self findElementOrNil: aSmaCCLR1Item.
	item := array at: index.
	item == nil 
		ifTrue: 
			[self atNewIndex: index put: aSmaCCLR1Item.
			self performClosureOn: aSmaCCLR1Item]
		ifFalse: [item mergeWith: aSmaCCLR1Item].
	^aSmaCCLR1Item