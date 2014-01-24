algorithm
createNodeWithoutEpsilonEdges: aSmaCCNode
	| newNode newTransitions |
	newNode := self createMergedNodeFrom: (self epsilonReachableNodesFrom: aSmaCCNode).
	nodeMap at: aSmaCCNode put: newNode.
	newTransitions := OrderedCollection new.
	newNode transitions
		do:
			[:each | 
			each isEpsilonTransition
				ifFalse:
					[newTransitions
						add: (each class to: (self removeEpsilonEdgesFrom: each to) on: each transitionObjects)]].
	newNode transitions: newTransitions.
	^newNode