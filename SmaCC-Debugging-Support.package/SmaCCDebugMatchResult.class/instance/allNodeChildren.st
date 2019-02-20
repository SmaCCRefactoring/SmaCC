inspector
allNodeChildren
	| allChildren |
	children isEmpty
		ifTrue: [ ^ #() ].
	allChildren := OrderedCollection new.
	matchedNodes
		do: [ :node | 
			node node
				nodesDo: [ :each | allChildren add: (self nodeChildFor: each) ]
				andTokensDo: [ :each | allChildren add: (self nodeChildFor: each) ] ].
	^ allChildren asSortedCollection: [ :a :b | a node startPosition < b node startPosition ]