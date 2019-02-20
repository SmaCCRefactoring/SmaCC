building
potentialStateActions
	| items ids |
	items := OrderedCollection new.
	self parser
		actionsAndSymbolsForState: self parser stateStack last
		do: [ :action :symbol | items add: (Array with: (self parser symbolNameFor: symbol) with: symbol with: (self actionLabelFor: action)) ].
	ids := self parser currentToken ifNotNil: [ :token | token ids ] ifNil: [ #() ].
	items := items
		asSortedCollection: [ :a :b | 
			| aIncluded |
			(aIncluded := ids includes: (a at: 2)) = (ids includes: (b at: 2))
				ifTrue: [ (a at: 2) < (b at: 2) ]
				ifFalse: [ aIncluded ] ].
	ids notEmpty
		ifTrue: [ items
				do: [ :each | 
					(ids includes: (each at: 2))
						ifTrue: [ each at: 1 put: each first asText allBold.
							each at: 3 put: each last asText allBold ]
						ifFalse: [ each at: 1 put: (each first asText makeAllColor: Color red).
							each at: 3 put: (each last asText makeAllColor: Color red) ] ] ].
	^ items