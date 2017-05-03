private
addMethodRuleTo: aRewrite
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewriteMethodDefinition new.
	self addRewrite: rewrite to: aRewrite