public
isUpToDate
	^timestamp = self currentFileTimestamp and: [rewrites allSatisfy: [:each | each isUpToDate]]