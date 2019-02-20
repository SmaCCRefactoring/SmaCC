private
expandEpsilonAndSymbolTransitions: aCollection
	| todo |
	todo := OrderedCollection withAll: aCollection.
	[ todo notEmpty ]
		whileTrue: [ todo removeFirst transitions
				do: [ :each | 
					(each isEpsilonTransition or: [ each isCharacterTransition not ])
						ifTrue: [ (aCollection includes: each to)
								ifFalse: [ aCollection add: each to.
									todo add: each to ] ] ] ].
	^ aCollection