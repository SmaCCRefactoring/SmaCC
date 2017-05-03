accessing
transformation: aSmaCCRewriteTransformation
	transformation := aSmaCCRewriteTransformation.
	transformation rewrite: self.
	self changed: #transformation