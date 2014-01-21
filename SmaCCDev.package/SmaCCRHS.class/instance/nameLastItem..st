accessing
nameLastItem: aString
	(variableNameMap at: aString ifAbsentPut: [OrderedCollection new]) add: collection size