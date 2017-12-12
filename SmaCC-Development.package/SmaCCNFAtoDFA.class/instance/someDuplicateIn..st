edges
someDuplicateIn: edgeCollection
	| objects |
	objects := SmaCCSet new.
	edgeCollection
		do: [ :edge | 
			(objects commonElementWith: edge transitionObjects) ifNotNil: [ :each | ^ each ].
			objects addAll: edge transitionObjects ].
	^ nil