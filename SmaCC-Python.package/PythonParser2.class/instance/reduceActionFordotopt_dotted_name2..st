generated-reduction actions
reduceActionFordotopt_dotted_name2: nodes
	| result |
	result := PyDotoptDottedNameNode new.
	result dots: (nodes at: 1).
	^ result