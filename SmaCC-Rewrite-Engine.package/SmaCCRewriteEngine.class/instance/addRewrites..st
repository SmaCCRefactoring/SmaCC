accessing
addRewrites: aCollection
	aCollection do: [ :each | self rewriteRule: each ]