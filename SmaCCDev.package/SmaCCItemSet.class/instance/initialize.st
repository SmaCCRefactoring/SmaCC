initialize
initialize
	(self class superclass canUnderstand: #initialize) ifTrue: [super initialize].
	type := #LALR1.
	previousItemSets := OrderedCollection new