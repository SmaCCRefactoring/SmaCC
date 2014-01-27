accessing
addTransformation: aSmaCCAbstractRewrite
	rewrites add: aSmaCCAbstractRewrite.
	aSmaCCAbstractRewrite parent: self.
	self modified