private
countBits: anInteger
	| count current |
	count := 0.
	current := anInteger.
	[ current = 0 ]
		whileFalse: [ (current bitAnd: 1) == 1
				ifTrue: [ count := count + 1 ].
			current := current bitShift: -1 ].
	^ count