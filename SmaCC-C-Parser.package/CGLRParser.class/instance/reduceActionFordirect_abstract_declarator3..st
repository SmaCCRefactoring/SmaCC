generated-reduction actions
reduceActionFordirect_abstract_declarator3: nodes
	| result |
	result := CGLRArrayDeclaratorNode new.
	result lEFT_BLOCKToken: (nodes at: 1).
	result _size: (nodes at: 2).
	result rIGHT_BLOCKToken: (nodes at: 3).
	^ result