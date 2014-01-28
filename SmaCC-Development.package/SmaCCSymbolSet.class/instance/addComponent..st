accessing
addComponent: aSmaCCSymbolSet
	(aSmaCCSymbolSet = self or: [components includes: aSmaCCSymbolSet]) ifTrue: [^self].
	components add: aSmaCCSymbolSet.
	aSmaCCSymbolSet addDependent: self.
	self addAll: aSmaCCSymbolSet symbols