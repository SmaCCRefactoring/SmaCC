private
hasChild: anObject position: positionSelector
	| position node |
	node := nil.
	(anObject isKindOf: SequenceableCollection)
		ifTrue: [node := positionSelector = #startPosition ifTrue: [anObject first] ifFalse: [anObject last]].
	(anObject isKindOf: SmaCCParseNode) ifTrue: [node := anObject].
	anObject isNil ifTrue: [^false].
	position := node perform: positionSelector.
	node nodesDo: [:child | (child perform: positionSelector) = position ifTrue: [^true]].
	^false