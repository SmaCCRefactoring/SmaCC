public
isRemoved: anIndex
	| interval |
	interval := self intervalContaining: anIndex.
	^interval isSentinel or: [interval isRemoved]