adding
addAll: aCollection
	(aCollection isKindOf: SmaCCCharacterSet)
		ifTrue: [ ^ characters addAll: aCollection ].
	^ super addAll: aCollection