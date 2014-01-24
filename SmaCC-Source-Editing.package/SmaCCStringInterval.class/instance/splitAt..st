editing
splitAt: anIndex
	| new |
	(self isSentinel or: [anIndex = start]) ifTrue: [^self].
	new := self copy.
	self stop: anIndex - 1.
	new start: anIndex.
	new insertAfter: self.
	^new