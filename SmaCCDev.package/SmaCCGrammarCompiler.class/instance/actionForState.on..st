action
actionForState: anInteger on: aSmaCCSymbol
	| action |
	action := (itemSets at: anInteger) action: aSmaCCSymbol prefer: (grammar preferredActionFor: aSmaCCSymbol).
	^self
		idForAction: action
		state: anInteger
		on: aSmaCCSymbol