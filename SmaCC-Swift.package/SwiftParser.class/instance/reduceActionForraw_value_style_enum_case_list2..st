generated-reduction actions
reduceActionForraw_value_style_enum_case_list2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	self add: ((nodes at: 3) at: 4) to: (result at: 4).
	self add: ((nodes at: 3) at: 5) to: (result at: 5).
	^ result