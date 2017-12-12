private
generateUnicodeCharacterSetFor: aSelector
	| stream |
	stream := WriteStream with: String new.
	0 to: SmaCCGrammar maximumUnicodeCharacterValue do: [ :i | 
		| ch |
		ch := Character value: i.
		(ch perform: aSelector)
			ifTrue: [ stream nextPut: ch ] ].
	^ stream contents