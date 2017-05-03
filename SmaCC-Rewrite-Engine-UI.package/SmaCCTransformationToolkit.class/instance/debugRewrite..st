actions
debugRewrite: aSmaCCRewrite
	| block |
	aSmaCCRewrite isNil
		ifTrue: [ ^ self ].
	block := [ :rewrite :node | rewrite == aSmaCCRewrite ].
	self debugUsingSeachBlock: block andTransformationBlock: block