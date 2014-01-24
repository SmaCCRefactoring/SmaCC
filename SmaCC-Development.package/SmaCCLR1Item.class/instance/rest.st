accessing
rest
	| newRHS |
	newRHS := self grammar newRHS.
	location + 1 to: rhs size do: [:each | newRHS add: (rhs at: each)].
	^newRHS