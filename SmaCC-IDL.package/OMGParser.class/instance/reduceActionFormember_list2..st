generated-reduction actions
reduceActionFormember_list2: nodes
	| result |
	result := ASTMemberListNode new.
	result memberList: (nodes at: 1).
	result member: (nodes at: 2).
	^ result