public
loadRewriteFile: aString
	aString isNil ifTrue: [^self].
	self rewrites: (self openRewriteFile: aString)