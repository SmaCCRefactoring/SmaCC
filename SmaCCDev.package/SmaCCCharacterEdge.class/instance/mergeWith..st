accessing
mergeWith: aSmaCCEdge 
	super mergeWith: aSmaCCEdge.
	transitionObjects := String withAll: (transitionObjects 
						asSortedCollection: [:a :b | a asInteger < b asInteger])