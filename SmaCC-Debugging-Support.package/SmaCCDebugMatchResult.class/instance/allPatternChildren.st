inspector
allPatternChildren
	| allChildren |
	children isEmpty
		ifTrue: [ ^ #() ].
	allChildren := OrderedCollection new.
	patternNode
		nodesDo: [ :each | allChildren add: (self patternChildFor: each) ]
		andTokensDo: [ :each | allChildren add: (self patternChildFor: each) ].
	^ allChildren asSortedCollection: [ :a :b | a patternNode startPosition < b patternNode startPosition ]