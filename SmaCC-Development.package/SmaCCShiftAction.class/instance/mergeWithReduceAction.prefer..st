merging
mergeWithReduceAction: aSmaCCAction prefer: aClass
	| result |
	(self precedence isNil or: [aSmaCCAction precedence isNil])
		ifTrue:
			[^(SmaCCAmbiguousAction new)
				addAction: self;
				addAction: aSmaCCAction;
				yourself].
	result := self.
	self precedence < aSmaCCAction precedence ifTrue: [result := aSmaCCAction].
	self precedence = aSmaCCAction precedence
		ifTrue:
			[aSmaCCAction class = aClass ifTrue: [result := aSmaCCAction].
			aClass = SmaCCRejectAction ifTrue: [result := SmaCCRejectAction item: self lr1Item]].
	^(SmaCCPreferredCompositeAction new)
		addAction: self;
		addAction: aSmaCCAction;
		preferredAction: result;
		yourself