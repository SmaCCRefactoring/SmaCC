examples
exampleFailure
	<gtExample>
	| jsParser result |
	jsParser := Smalltalk at: #JSParser ifAbsent: [ ^ nil ].
	result := (jsParser parse: '`?a` + `?a` + `?a`' startingAt: jsParser startingStateForExpression)
		debugMatch: (jsParser parse: '2 + 2 + 3' startingAt: jsParser startingStateForExpression).
	self assert: result matched not.
	^ result