actions-rewrites
removeTransformation: aSmaCCAbstractRewrite
	aSmaCCAbstractRewrite parent
		removeTransformation: aSmaCCAbstractRewrite.
	self changed: #removedTransformation: with: aSmaCCAbstractRewrite