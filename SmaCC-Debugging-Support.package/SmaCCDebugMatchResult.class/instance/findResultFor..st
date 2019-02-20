private
findResultFor: anObject
	patternNode == anObject
		ifTrue: [ ^ self ].
	1 to: children size do: [ :i | 
		| result |
		result := (children at: i) findResultFor: anObject.
		result notNil
			ifTrue: [ [ children size > i ] whileTrue: [ children removeLast ].
				^ result ] ].
	^ self createResultFor: anObject