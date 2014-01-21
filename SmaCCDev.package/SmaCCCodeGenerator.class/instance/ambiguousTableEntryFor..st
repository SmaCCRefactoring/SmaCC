compiling
ambiguousTableEntryFor: aCollection
	| entry |
	entry := aCollection asArray.
	^ambiguousActions
		indexOf: entry
		ifAbsent:
			[ambiguousActions add: entry.
			ambiguousActions size]