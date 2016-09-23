private
characterNode
	^ (SmaCCCharacterRENode characters: self characters)
		addStates: states;
		action: action;
		yourself