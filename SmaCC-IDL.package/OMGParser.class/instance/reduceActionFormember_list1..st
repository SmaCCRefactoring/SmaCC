generated-reduction actions
reduceActionFormember_list1: nodes
	| result |
	result := ASTMemberListNode new.
	result member: (nodes at: 1).
	^ result