"
A few tests to explore the ambiguity of a GLR grammar.


"
Class {
	#name : #CGLRTests,
	#superclass : #TestCase,
	#category : 'SmaCC-C-Parser'
}

{ #category : #examples }
CGLRTests class >> ambiguityAsAttribute [
	<example>
	| block |
	block := [ :in :others | 
	in
		ifNotNil: [ in isCollection
				ifTrue: [ 1 to: in size do:
						[ :i | block value: (in at: i) value: (others collect: [ :e | e at: i ]) ] ]
				ifFalse: [ others do: [ :i | in ambiguous: i ] ] ] ].
	^ [ CGLRParser
		parse:
			' void f(int i) {
	i * i;
} ' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			| results |
			results := ex tag
				collect: [ :t | t performOnSmaCCParser: ex parser ].
			block value: results first value: results allButFirst.
			ex resume: results first ]
]

{ #category : #examples }
CGLRTests class >> ambiguityAsAttribute2 [
	<example>
	| block |
	block := [ :in :others | 
	in
		ifNotNil: [ in isCollection
				ifTrue: [ 1 to: in size do:
						[ :i | block value: (in at: i) value: (others collect: [ :e | e at: i ]) ] ]
				ifFalse: [ others do: [ :i | in ambiguous: i ] ] ] ].
	^ [ CGLRParser parse: ' int i;' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			| results |
			results := ex tag
				collect: [ :t | t performOnSmaCCParser: ex parser ].
			block value: results first value: results allButFirst.
			ex resume: results first ]
]

{ #category : #examples }
CGLRTests class >> ambiguityAsAttribute3 [
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
]

{ #category : #examples }
CGLRTests class >> inspectingAmbiguousNotification [
	<example>
	[ CGLRParser
		parse:
			' void f(int i) {
	i * i;
} ' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			ex inspect.
			ex resume: ex tag first ]
]

{ #category : #examples }
CGLRTests class >> inspectingAmbiguousNotificationWithHalt [
	<example>
	[ CGLRParser
		parse:
			'typedef int i;
void f() {
	i * i;
}' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | 
			self halt.
			ex resume: ex tag first ]
]
