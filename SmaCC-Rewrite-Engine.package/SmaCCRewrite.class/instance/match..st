initialize
match: aSmaCCRewriteMatch
	match := aSmaCCRewriteMatch.
	match rewrite: self.
	self modified.
	self trigger: #match