generated-reduction actions
reduceActionForRegexTerm12: nodes
	| readStream start stop |
	readStream := ReadStream on: ((nodes at: 2) value copyFrom: 2 to: (nodes at: 2) value size - 1).
	start := readStream upTo: $,.
	stop := readStream upToEnd.
	^ (nodes at: 1)
		repeatFor:
			(start isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ start asNumber ])
		to:
			(stop isEmpty
				ifTrue: [ 1 bitShift: 31 ]
				ifFalse: [ stop asNumber ])