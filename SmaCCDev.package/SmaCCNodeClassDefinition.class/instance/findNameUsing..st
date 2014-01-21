private
findNameUsing: aCollection
	| string index indexString |
	index := 0.
	indexString := ''.
	[string := aCollection
		detect: [:each | (self hierarchyDefinesVariable: each , indexString) not]
		ifNone: [nil].
	string notNil ifTrue: [^string , indexString].
	index := index + 1.
	indexString := index printString] repeat