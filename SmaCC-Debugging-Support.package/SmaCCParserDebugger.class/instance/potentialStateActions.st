building
potentialStateActions
	| items |
	items := OrderedCollection new.
	self parser
		actionsAndSymbolsForState: self parser stateStack last
		do:
			[ :action :symbol | items add: (Array with: (self parser symbolNameFor: symbol) with: (self actionLabelFor: action)) ].
	^ items