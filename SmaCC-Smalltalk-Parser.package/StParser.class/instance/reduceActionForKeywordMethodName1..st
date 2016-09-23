generated-reduction actions
reduceActionForKeywordMethodName1: nodes
	| stream |
	stream := WriteStream on: (String new: 30).
	stream nextPutAll:
		(nodes at: 1) value.
	^ Array with: stream with: (OrderedCollection with: (nodes at: 2))