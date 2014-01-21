copying
copyEmpty: anInteger
	^(super copyEmpty: anInteger)
		type: type;
		previousItemSets: previousItemSets;
		grammar: grammar;
		yourself