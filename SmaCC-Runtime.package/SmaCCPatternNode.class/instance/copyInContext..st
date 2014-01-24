matching
copyInContext: aDictionary
	^(aDictionary at: self ifAbsent: [nil]) copy