generated-reduction actions
reduceActionFordirect_declarator5: nodes
	| result |
	result := CGLRArrayDeclaratorNode new.
	result declarator: (nodes at: 1).
	result lEFT_BLOCKToken: (nodes at: 2).
	result rIGHT_BLOCKToken: (nodes at: 3).
	^ result