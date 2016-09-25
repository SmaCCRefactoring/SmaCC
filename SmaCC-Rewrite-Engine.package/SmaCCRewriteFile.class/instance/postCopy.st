copying
postCopy
	| oldRewrites |
	super postCopy.
	oldRewrites := self rewrites.
	rewrites := OrderedCollection new: oldRewrites size.
	oldRewrites do: [ :each | self addTransformation: each copy ].
	cachedLists := IdentityDictionary new