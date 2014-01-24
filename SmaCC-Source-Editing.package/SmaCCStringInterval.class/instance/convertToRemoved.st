private
convertToRemoved
	| interval |
	(self isRemoved or: [self isSentinel]) ifTrue: [^self].
	isRemoved := true.
	(previous canBeMergedWith: self)
		ifTrue:
			[interval := previous.
			interval stop: self stop.
			interval next: next.
			self removed.
			^interval].
	(self canBeMergedWith: next)
		ifTrue:
			[interval := next.
			next start: self start.
			previous next: next.
			self removed.
			^interval].
	^self