compiling-scanner
closestIsExpressionsFor: aSmaCCCharacterEdge seen: aCollection
	| expressions |
	expressions := OrderedCollection new.
	self class isExpressions
		keysAndValuesDo: [ :selector :string | 
			| isInString |
			isInString := false.
			((string
				allSatisfy: [ :each | 
					(aSmaCCCharacterEdge transitionObjects includes: each)
						ifTrue: [ isInString := true ]
						ifFalse: [ aCollection includes: each ] ]) and: [ isInString ])
				ifTrue: [ expressions add: selector ] ].
	(expressions isEmpty
		or: [ (self minMaxPairsFor: aSmaCCCharacterEdge without: expressions) size
				> (self minMaxPairsFor: aSmaCCCharacterEdge without: #()) size ])
		ifTrue: [ ^ #() ].
	expressions size > 1
		ifTrue: [ | strings newExpressions |
			strings := expressions
				collect: [ :each | 
					each
						->
							((self class isExpressions at: each)
								select: [ :char | aSmaCCCharacterEdge transitionObjects includes: char ]) ].
			strings := strings
				asSortedCollection: [ :a :b | 
					a value size > b value size
						or: [ a value size = b value size
								and: [ (self class isExpressions at: a key) size
										< (self class isExpressions at: b key) size ] ] ].
			newExpressions := OrderedCollection with: strings first.
			2 to: strings size do: [ :i | 
				| left |
				left := (strings at: i) value.
				newExpressions
					do: [ :each | left := left reject: [ :char | each value includes: char ] ].
				left notEmpty
					ifTrue: [ newExpressions add: (strings at: i) ] ].
			expressions := newExpressions collect: [ :each | each key ] ].
	^ expressions