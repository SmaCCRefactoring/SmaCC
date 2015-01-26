generated-reduction actions
reduceActionFordotopt_dotted_name3: nodes
	| result |
	result := PyDotoptDottedNameNode new.
	result dots: (nodes at: 1).
	result _name: (nodes at: 2).
	^ result