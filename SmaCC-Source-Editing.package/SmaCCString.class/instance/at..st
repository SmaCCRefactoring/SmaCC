accessing
at: anIndex
	^(self intervalContaining: anIndex) string at: (self indexFor: anIndex)