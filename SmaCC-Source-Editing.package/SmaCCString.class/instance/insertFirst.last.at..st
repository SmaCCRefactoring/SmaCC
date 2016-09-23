private
insertFirst: first last: last at: anInteger
	| interval |
	interval := self intervalContaining: anInteger.
	interval := interval splitAt: (self indexFor: anInteger).
	interval previous next: first.
	last next: interval.
	^ first startIndex