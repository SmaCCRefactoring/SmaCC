accessing
indices
	^ indices ifNil: [ self computeIndices ]