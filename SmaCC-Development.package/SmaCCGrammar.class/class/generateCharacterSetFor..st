private
generateCharacterSetFor: aSelector
	| set |
	set := SmaCCCharacterSet new.
	0 to: SmaCCGrammar maximumCharacterValue do: [ :i | 
		| ch |
		ch := Character value: i.
		(ch perform: aSelector)
			ifTrue: [ set add: ch ] ].
	^ set