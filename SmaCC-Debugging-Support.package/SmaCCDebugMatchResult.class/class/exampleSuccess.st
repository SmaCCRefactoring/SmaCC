examples
exampleSuccess
	<gtExample>
	| jsParser result |
	jsParser := Smalltalk at: #JSParser ifAbsent: [ ^ nil ].
	result := (jsParser parse: 'f(`?a{beList}`,1,`?b{beList}`,4,`?c{beList}`)' startingAt: jsParser startingStateForExpression)
		debugMatch: (jsParser parse: 'f(0,1,2,3,4)' startingAt: jsParser startingStateForExpression).
	self assert: result matched.
	^ result