accessing
originalStopPosition: anObject
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self originalStopPosition: each ] ].
	((anObject isKindOf: SmaCCParseNode)
		or: [ anObject isKindOf: SmaCCToken ])
		ifTrue: [ ^ anObject stopPosition ].
	^ nil