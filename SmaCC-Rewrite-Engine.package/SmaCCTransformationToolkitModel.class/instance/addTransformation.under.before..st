actions-rewrites
addTransformation: aSmaCCAbstractRewrite under: aSmaCCRewriteFile before: anotherSmaCCAbstractRewrite
	anotherSmaCCAbstractRewrite isNil
		ifTrue: [ aSmaCCRewriteFile addTransformation: aSmaCCAbstractRewrite ]
		ifFalse:
			[ aSmaCCRewriteFile
				addTransformation: aSmaCCAbstractRewrite
				before: anotherSmaCCAbstractRewrite ].
	self
		changed: #addTransformation:under:
		with:
			(Array with: aSmaCCAbstractRewrite with: aSmaCCRewriteFile)