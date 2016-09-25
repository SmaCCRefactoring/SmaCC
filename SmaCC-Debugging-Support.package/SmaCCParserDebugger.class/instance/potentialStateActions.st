building
potentialStateActions
	| items |
	items := OrderedCollection new.
	self
		actionsAndSymbolsFor: (self parser transitionTable at: self parser stateStack last)
		do:
			[ :action :symbol | items add: (Array with: (self symbolLabelFor: symbol) with: (self actionLabelFor: action)) ].
	^ items