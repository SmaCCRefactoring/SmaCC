accessing-hierarchy
hierarchyCount
	^ superclass isNil
		ifTrue: [ 0 ]
		ifFalse: [ superclass hierarchyCount + 1 ]