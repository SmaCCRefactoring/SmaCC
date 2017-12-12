private
hasMore: aCollection after: index
	^ ((index + 1 to: aCollection size) allSatisfy: [ :i | (aCollection at: i) == 0 ]) not