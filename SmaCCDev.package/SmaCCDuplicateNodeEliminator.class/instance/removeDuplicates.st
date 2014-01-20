algorithm
removeDuplicates
	| changed iterations |
	changed := true.
	iterations := root allStates size.
	[changed and: [iterations > 0]] whileTrue: 
			[changed := false.
			iterations := iterations - 1.
			self mergeAllTransitions.
			self pairsDo: 
					[:firstNode :secondNode | 
					comparisonState := Dictionary new.
					(self isNode: firstNode equivalentTo: secondNode) 
						ifTrue: 
							[firstNode mergeWith: secondNode.
							changed := true]]]