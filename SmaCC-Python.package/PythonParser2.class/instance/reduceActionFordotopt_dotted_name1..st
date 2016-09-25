generated-reduction actions
reduceActionFordotopt_dotted_name1: nodes
	| result |
	result := PyDotoptDottedNameNode new.
	result name: (nodes at: 1).
	^ result