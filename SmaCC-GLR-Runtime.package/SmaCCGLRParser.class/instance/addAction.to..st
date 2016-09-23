private
addAction: action to: anOrderedCollection
	(anOrderedCollection includes: action)
		ifTrue: [ ^ self ].
	anOrderedCollection add: action