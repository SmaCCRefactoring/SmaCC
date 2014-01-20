accessing
precedence
	"If we don't have a precedence, then assume we are the lowest precedence (which will cause a shift action)."

	| max |
	max := -1.
	rhs do: [:each | max := max max: (each precedence ifNil: [max])].
	^max