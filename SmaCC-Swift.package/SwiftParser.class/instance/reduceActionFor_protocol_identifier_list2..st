generated-reduction actions
reduceActionFor_protocol_identifier_list2: nodes
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 2).
	^ result