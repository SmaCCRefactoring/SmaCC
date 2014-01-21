merging
mergedNodeFor: nodeCollection 
	| mergedNodes |
	mergedNodes := nodeCollection asSortedCollection asArray.
	^mergedStates at: mergedNodes
		ifAbsent: 
			[| newNode |
			newNode := self createMergedNodeFrom: mergedNodes.
			mergedStates
				at: mergedNodes put: newNode;
				at: (Array with: newNode) put: newNode.
			self eliminateDuplicateTransitionsIn: newNode.
			newNode]