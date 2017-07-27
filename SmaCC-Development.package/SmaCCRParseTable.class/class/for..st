instance creation
for: aParser
	^ self new
		symbols: aParser symbolNames;
		reduces: aParser reduceTable;
		transitions: aParser transitionTable