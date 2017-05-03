private
addRuleTo: aRewrite
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewrite newInstance.
	self addRewrite: rewrite to: aRewrite