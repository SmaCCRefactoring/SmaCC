generated-reduction actions
reduceActionFordirect_abstract_declarator2: nodes
	| result |
	result := CGLRArrayDeclaratorNode new.
	result lEFT_BLOCKToken: (nodes at: 1).
	result rIGHT_BLOCKToken: (nodes at: 2).
	^ result