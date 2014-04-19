accessing
indentStack
	^ indentStack ifNil: [ indentStack := OrderedCollection with: 0 ]