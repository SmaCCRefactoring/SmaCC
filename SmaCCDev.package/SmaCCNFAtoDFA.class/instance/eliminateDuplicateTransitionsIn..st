private-merging nodes
eliminateDuplicateTransitionsIn: aSmaCCNode 
	| newTransitions conflictingObject |
	newTransitions := aSmaCCNode transitions collect: [:each | each copy].
	
	[conflictingObject := self someDuplicateIn: newTransitions.
	conflictingObject notNil] 
			whileTrue: 
				[| conflictingEdges newEdge |
				conflictingEdges := newTransitions 
							select: [:each | each includes: conflictingObject].
				newEdge := self createEdgeMerging: conflictingEdges.
				newTransitions add: newEdge].
	self setTransitionsOn: aSmaCCNode to: newTransitions