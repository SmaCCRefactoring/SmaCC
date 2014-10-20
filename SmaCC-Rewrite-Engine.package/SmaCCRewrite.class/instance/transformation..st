initialize
transformation: aSmaCCRewriteTransformation
	transformation := aSmaCCRewriteTransformation.
	transformation rewrite: self.
	self modified.
	self trigger: #transformation