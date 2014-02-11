generated-reduction actions
reduceActionForstatement_expression_list1: nodes
	| result |
	result := JavaStatementExpressionListNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result