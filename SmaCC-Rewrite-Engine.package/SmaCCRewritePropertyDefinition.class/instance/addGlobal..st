accessing
addGlobal: aString
	globalValues at: aString asSymbol put: SmaCCRewriteMatchContext uninitializedValue.
	self changed: #globals