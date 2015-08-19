generated-reduction actions
reduceActionFor_extern_alias_directives2: nodes
	| result |
	result := OrderedCollection new: 2.
	self addAll: (nodes at: 1) to: result.
	^ result