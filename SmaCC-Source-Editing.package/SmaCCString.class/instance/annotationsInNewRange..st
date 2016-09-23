actions
annotationsInNewRange: range
	| startIndex first last annotations current |
	annotations := Set new.
	startIndex := 0.
	first := range start.
	last := range isEmpty
		ifTrue: [ first ]
		ifFalse: [ range stop ].
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ startIndex > last
				ifTrue: [ ^ annotations asOrderedCollection ].
			startIndex := startIndex + current size.
			startIndex >= first
				ifTrue: [ annotations addAll: current annotations ].
			current := current next ].
	^ annotations asOrderedCollection