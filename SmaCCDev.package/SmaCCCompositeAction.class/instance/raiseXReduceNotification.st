error
raiseXReduceNotification
	| stream |
	stream := WriteStream with: String new.
	actions
		do:
			[:each | 
			stream nextPutAll: each lr1Item printString.
			each == self preferredAction ifTrue: [stream nextPutAll: '	*****'].
			stream cr].
	stream cr.
	self printPathOn: stream.
	SmaCCCompilationNotification signal: self errorType with: stream contents