accessing
followed: aSmaCCGraphNode
	followed := aSmaCCGraphNode.
	aSmaCCGraphNode notNil
		ifTrue: [ aSmaCCGraphNode addPrevious: self ]