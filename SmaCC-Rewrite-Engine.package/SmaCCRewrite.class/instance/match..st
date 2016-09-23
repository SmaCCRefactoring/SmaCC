accessing
match: aSmaCCRewriteMatch
	match := aSmaCCRewriteMatch.
	match rewrite: self.
	self modified.
	self changed: #match