actions
addTransformation: aSmaCCAbstractRewrite under: aSmaCCRewriteFile before: anotherSmaCCAbstractRewrite
	anotherSmaCCAbstractRewrite isNil
		ifTrue: [aSmaCCRewriteFile addTransformation: aSmaCCAbstractRewrite]
		ifFalse: [aSmaCCRewriteFile addTransformation: aSmaCCAbstractRewrite before: anotherSmaCCAbstractRewrite].
	self
		trigger: #addTransformation:under:
		with: aSmaCCAbstractRewrite
		with: aSmaCCRewriteFile