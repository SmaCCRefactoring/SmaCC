accessing
addTransformation: aSmaCCAbstractRewrite before: anotherSmaCCAbstractRewrite
	rewrites add: aSmaCCAbstractRewrite before: anotherSmaCCAbstractRewrite.
	aSmaCCAbstractRewrite parent: self.
	self changed: #rewrites