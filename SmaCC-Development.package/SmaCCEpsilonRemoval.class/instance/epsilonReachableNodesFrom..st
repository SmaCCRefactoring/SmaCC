algorithm
epsilonReachableNodesFrom: aSmaCCNode
	| todo reachable node |
	reachable := Set with: aSmaCCNode.
	todo := OrderedCollection with: aSmaCCNode.
	[ todo notEmpty ]
		whileTrue:
			[ node := todo removeLast.
			node transitions
				do:
					[ :each | 
					(each isEpsilonTransition and: [ (reachable includes: each to) not ])
						ifTrue: [ reachable add: each to.
							todo add: each to ] ] ].
	^ reachable