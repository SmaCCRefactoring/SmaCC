accessing
addAll: aCollection 
	| oldSize |
	oldSize := symbols size.
	symbols addAll: aCollection.
	oldSize ~= symbols size ifTrue: [self changed]