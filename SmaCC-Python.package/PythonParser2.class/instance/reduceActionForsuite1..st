generated-reduction actions
reduceActionForsuite1: nodes
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result