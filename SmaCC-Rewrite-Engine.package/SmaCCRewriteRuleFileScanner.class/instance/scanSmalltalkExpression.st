private
scanSmalltalkExpression
	| expression |
	expression := ''.
	[ stream atEnd
		ifTrue: [ self error: 'Invalid Smalltalk expression' ].
	expression := expression , (stream upTo: $]).
	self isValidSmalltalk: expression ]
		whileFalse: [ expression := expression copyWith: $] ].
	stream skip: -1.
	^ self fixExpression: expression