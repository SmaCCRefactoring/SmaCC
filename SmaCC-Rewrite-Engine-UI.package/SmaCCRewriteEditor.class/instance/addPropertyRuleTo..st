private
addPropertyRuleTo: aRewrite
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewritePropertyDefinition new.
	self addRewrite: rewrite to: aRewrite