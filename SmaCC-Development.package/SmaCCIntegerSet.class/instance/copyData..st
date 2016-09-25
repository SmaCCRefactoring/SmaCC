private
copyData: anObject
	| copy |
	^ (anObject isKindOf: Collection)
		ifTrue:
			[ copy := anObject copy.
			1 to: copy size do: [ :i | copy at: i put: (self copyData: (copy at: i)) ].
			copy ]
		ifFalse: [ anObject ]