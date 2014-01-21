graph
copyEdgesWith: aDictionary
	| todo |
	todo := OrderedCollection with: root.
	[todo notEmpty]
		whileTrue:
			[| node |
			node := todo removeFirst.
			(aDictionary at: node)
				transitions:
					(node sortedTransitions
						do:
							[:each | 
							| copy |
							copy := each copy.
							copy to: (aDictionary at: each to).
							copy])]