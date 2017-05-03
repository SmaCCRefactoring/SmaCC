accessing
stringIndexFor: anIndex
	| interval result position |
	interval := self intervalContaining: anIndex.
	result := (interval isSentinel or: [ interval isRemoved ])
		ifTrue: [ 0 ]
		ifFalse: [ position := anIndex isInteger
				ifTrue: [ anIndex ]
				ifFalse: [ anIndex index ].
			interval start > position
				ifTrue: [ 0 ]
				ifFalse: [ interval stop < position
						ifTrue: [ interval stop - interval start + 1 ]
						ifFalse: [ position - interval start + 1 ] ] ].
	[ interval := interval previous.
	interval isSentinel ]
		whileFalse: [ interval isRemoved
				ifFalse: [ result := result + (interval stop - interval start + 1) ] ].
	^ result