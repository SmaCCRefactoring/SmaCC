generated
scenario: aCucScenarioNode
	self scenario notNil
		ifTrue: [ self scenario parent: nil ].
	scenario := aCucScenarioNode.
	self scenario notNil
		ifTrue: [ self scenario parent: self ]