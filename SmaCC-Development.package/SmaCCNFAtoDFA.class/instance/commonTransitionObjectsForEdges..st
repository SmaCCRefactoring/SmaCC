edges
commonTransitionObjectsForEdges: edgeCollection
	^ edgeCollection
		inject: edgeCollection first transitionObjects
		into: [ :sum :each | sum smaccIntersect: each transitionObjects ]