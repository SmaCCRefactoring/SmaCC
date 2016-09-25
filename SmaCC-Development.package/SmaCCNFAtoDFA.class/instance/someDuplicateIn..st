edges
someDuplicateIn: edgeCollection
	| objects |
	objects := SmaCCSet new.
	edgeCollection
		do:
			[ :edge | 
			edge transitionObjects
				do: [ :each | 
					(objects includes: each)
						ifTrue: [ ^ each ] ].
			objects addAll: edge transitionObjects ].
	^ nil