private
assignCharacters: newCharacters
	| sortedCharacters stream |
	sortedCharacters := newCharacters
		asSortedCollection: [ :a :b | a asInteger < b asInteger ].
	stream := WriteStream with: String new.
	sortedCharacters
		inject: nil
		into:
			[ :sum :each | 
			(sum = each
				or: [ each asInteger > SmaCCGrammar maximumCharacterValue ])
				ifFalse: [ stream nextPut: each ].
			each ].
	characters := stream contents