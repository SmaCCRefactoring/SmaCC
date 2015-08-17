accessing
variableName
	self
		productionsDo: [ :each | 
			| vars |
			vars := each variableNames asArray.
			vars notEmpty
				ifTrue: [ ^ vars first ] ].
	^ self error: 'No variable found -- should only be called when returnsSingleVariable is true'