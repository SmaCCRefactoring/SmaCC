algorithm
removeDuplicates
	| changed |
	changed := true.
	[changed]
		whileTrue:
			[changed := false.
			self mergeAllTransitions.
			self
				pairsDo:
					[:firstNode :secondNode | 
					comparisonState := Dictionary new.
					(self isNode: firstNode equivalentTo: secondNode)
						ifTrue:
							[firstNode mergeWith: secondNode.
							changed := true]]]