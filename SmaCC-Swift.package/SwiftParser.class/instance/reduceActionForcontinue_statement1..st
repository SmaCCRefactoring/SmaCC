generated-reduction actions
reduceActionForcontinue_statement1: nodes
	| result |
	result := SwiftContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result