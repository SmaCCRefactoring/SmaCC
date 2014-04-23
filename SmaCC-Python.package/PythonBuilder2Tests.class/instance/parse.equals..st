as yet unclassified
parse: aString equals: aValue
	self assert: (PythonParser2 parse: aString) first first equals: aValue