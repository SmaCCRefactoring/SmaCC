private
modelTypesForVariable: aString seen: anIdentitySet
	| productionTypes |
	(anIdentitySet includes: self) ifTrue: [^#()].
	anIdentitySet add: self.
	productionTypes := Set new.
	self
		basicModelTypesForVariable: aString
		into: productionTypes
		seen: anIdentitySet.
	^productionTypes