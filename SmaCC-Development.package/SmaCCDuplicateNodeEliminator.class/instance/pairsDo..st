private
pairsDo: aBlock
	| nodes |
	nodes := root allStates asOrderedCollection.
	1 to: nodes size - 1 do: [ :i | i + 1 to: nodes size do: [ :j | aBlock value: (nodes at: i) value: (nodes at: j) ] ]