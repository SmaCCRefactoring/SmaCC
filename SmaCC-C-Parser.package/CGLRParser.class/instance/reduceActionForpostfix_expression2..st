generated-reduction actions
reduceActionForpostfix_expression2: nodes
	| result |
	result := CGLRArrayNode new.
	result array: (nodes at: 1).
	result lEFT_BLOCKToken: (nodes at: 2).
	result index: (nodes at: 3).
	result rIGHT_BLOCKToken: (nodes at: 4).
	^ result