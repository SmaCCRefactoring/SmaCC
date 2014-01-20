private-edges
createEdgeMerging: conflictingEdgeCollection 
	| newNode common newEdge |
	newNode := self 
				mergedNodeFor: (conflictingEdgeCollection collect: [:each | each to]).
	common := self commonTransitionObjectsForEdges: conflictingEdgeCollection.
	newEdge := conflictingEdgeCollection first class to: newNode on: common.
	conflictingEdgeCollection do: [:each | each remove: common].
	^newEdge