accessing
modelTypes: anIdentitySet
	cachedTypes isNil ifTrue: [cachedTypes := self basicModelTypes: anIdentitySet].
	^cachedTypes