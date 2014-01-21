edges
commonTransitionObjectsForEdges: edgeCollection
	^edgeCollection
		inject: edgeCollection first transitionObjects
		into: [:sum :each | sum select: [:char | each includes: char]]