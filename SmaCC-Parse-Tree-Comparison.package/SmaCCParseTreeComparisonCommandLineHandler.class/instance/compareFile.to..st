public
compareFile: aString to: anotherString
	| tree1 tree2 |
	tree1 := self parseTreeFor: aString.
	tree2 := self parseTreeFor: anotherString.
	tree1 = tree2
		ifFalse: [ self exitFailure: 'ASTs are different' ].
	self exitSuccess