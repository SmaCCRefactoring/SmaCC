action
transitionTable
	actions isNil
		ifTrue:
			[self createItemSets.
			self createTransitionTable].
	^actions