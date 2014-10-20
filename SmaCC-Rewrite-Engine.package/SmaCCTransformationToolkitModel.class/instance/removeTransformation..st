actions
removeTransformation: aSmaCCAbstractRewrite
	aSmaCCAbstractRewrite parent removeTransformation: aSmaCCAbstractRewrite.
	self trigger: #removedTransformation: with: aSmaCCAbstractRewrite