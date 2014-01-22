private
initializeIsExpressions
	"Creates a map from sets of characters to selectors that start with 'is' on Character. This allows generated scanners to take
	full advantage of selectors that are already implemented on Character"

	| selectors |
	isExpressions := Dictionary new.
	selectors := Character selectors
		select:
			[:each | ('is*' match: each) and: [each isUnary and: [(each at: 3) isUppercase]]].
	selectors
		do:
			[:sel | 
			| string |
			string := self generateCharacterSetFor: sel.
			string isEmpty ifFalse: [isExpressions at: string put: sel]]