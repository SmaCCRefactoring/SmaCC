compiling
allTransitionsWith: selectedStates visited: aSet
	"Count effective number of transitions for that node when compiling; this is where the hard limit on method length can be determined."

	(aSet includes: self)
		ifTrue: [ ^ 1 ].
	aSet add: self.
	^ transitions
		inject: 1
		into: [ :sum :aTransition | 
			(selectedStates includes: aTransition to)
				ifTrue: [ sum + 1 ]
				ifFalse: [ sum + (aTransition to allTransitionsWith: selectedStates visited: aSet) ] ]