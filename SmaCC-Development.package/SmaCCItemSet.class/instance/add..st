adding
add: aSmaCCLR1Item
	| index item |
	aSmaCCLR1Item isNil
		ifTrue: [ ^ aSmaCCLR1Item ].
	index := self findElementOrNil: aSmaCCLR1Item.
	item := array at: index.
	item isNil
		ifTrue:
			[ self atNewIndex: index put: aSmaCCLR1Item.
			aSmaCCLR1Item itemSet: self.
			self performClosureOn: aSmaCCLR1Item ]
		ifFalse: [ item mergeWith: aSmaCCLR1Item ].
	^ aSmaCCLR1Item