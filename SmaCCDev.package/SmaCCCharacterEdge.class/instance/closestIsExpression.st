compiling
closestIsExpression
	"Attempts to find the #is selector that most closely matches the character set that this edge transitions on."

	| expressions closest |
	expressions := IsExpressions keys 
				select: [:each | each allSatisfy: [:ch | self includes: ch]].
	expressions isEmpty ifTrue: [^nil].
	closest := IsExpressions 
				at: (expressions asSortedCollection: [:a :b | a size > b size]) first.
	(self minMaxPairsWithout: closest) size 
		<= (self minMaxPairsWithout: nil) size ifFalse: [^nil].
	^closest