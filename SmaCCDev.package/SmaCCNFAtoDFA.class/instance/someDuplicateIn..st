private-edges
someDuplicateIn: edgeCollection 
	| objects |
	objects := Set new.
	edgeCollection do: 
			[:edge | 
			edge transitionObjects do: [:each | (objects includes: each) ifTrue: [^each]].
			objects addAll: edge transitionObjects].
	^nil