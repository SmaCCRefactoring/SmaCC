examples
ambiguityAsAttribute3
	<example>
	| block |
	block := [ :in :others | 
	in
		ifNotNil: [ in isCollection
				ifTrue: [ 1 to: in size do:
						[ :i | block value: (in at: i) value: (others collect: [ :e | e at: i ]) ] ]
				ifFalse: [ in attributeNamed: #ambiguous put: others ] ] ].
	^ [ CGLRParser
		parse:
			' int i; void f() { i * i; }' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			| results |
			results := ex tag
				collect: [ :t | t performOnSmaCCParser: ex parser ].
			block value: results first value: results allButFirst.
			ex resume: results first ]