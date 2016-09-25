actions
annotationRangesFor: aSmaCCAnnotation
	| ranges startIndex current |
	ranges := OrderedCollection new.
	startIndex := 1.
	current := firstSentinel next.
	[ current isSentinel ]
		whileFalse:
			[ (current isRemoved not
				and: [ current annotations includes: aSmaCCAnnotation ])
				ifTrue: [ ranges
						add: (startIndex to: startIndex + current size - 1) ].
			startIndex := startIndex + current size.
			current := current next ].
	^ ranges