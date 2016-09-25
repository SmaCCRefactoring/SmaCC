algorithm
removeDuplicates
	| toMerge |
	[ toMerge := Dictionary new.
	self mergeAllTransitions.
	self
		pairsDo:
			[ :firstNode :secondNode | 
			comparisonState := Dictionary new.
			(self isNode: firstNode equivalentTo: secondNode)
				ifTrue: [ (toMerge at: firstNode ifAbsentPut: [ Set new ])
						add: secondNode ] ].
	toMerge notEmpty ]
		whileTrue:
			[ toMerge values
				do: [ :each | each do: [ :node | toMerge removeKey: node ifAbsent: [  ] ] ].
			self mergeNodeUsing: toMerge ]