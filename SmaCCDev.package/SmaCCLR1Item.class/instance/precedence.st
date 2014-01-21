accessing
precedence
	| max |
	self isAtEnd
		ifTrue:
			[max := -1.	"If we don't have a precedence, then assume we are the lowest precedence (which will cause a shift action)."
			rhs do: [:each | max := max max: (each precedence ifNil: [max])].
			^max]
		ifFalse: [^(rhs at: location) precedence]