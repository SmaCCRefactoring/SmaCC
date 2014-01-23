accessing
mergeStacks: stacksOrderedCollection
	| result choiceBlock choices |
	choices := 1 to: stacksOrderedCollection size.
	choiceBlock :=
		[ :possibleChoices :parser | 
		| returnValue newChoices |
		choices size == 1
			ifTrue: [ possibleChoices at: choices first ]
			ifFalse: [ 
				returnValue := (SmaCCAmbiguousResultNotification forParser: parser)
					signal: 'Ambiguous results'
					with: (choices collect: [ :each | possibleChoices at: each ]).
				newChoices := choices select: [ :each | (possibleChoices at: each) == returnValue ].
				newChoices notEmpty
					ifTrue: [ choices := newChoices ].
				returnValue ] ].
	result := OrderedCollection new.
	1 to: stacksOrderedCollection first size do: [ :i | 
		| object |
		object := stacksOrderedCollection first at: i.
		(stacksOrderedCollection allSatisfy: [ :each | object == (each at: i) ])
			ifTrue: [ result add: object ]
			ifFalse: [ 
				result
					add:
						(self new
							possibleItems: (stacksOrderedCollection collect: [ :each | each at: i ]);
							choiceBlock: choiceBlock;
							yourself) ] ].
	^ result