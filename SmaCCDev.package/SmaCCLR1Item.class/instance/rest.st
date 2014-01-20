accessing
rest
	| newRHS |
	newRHS := SmaCCRHS new.
	location + 1 to: rhs size do: [:each | newRHS add: (rhs at: each)].
	^newRHS