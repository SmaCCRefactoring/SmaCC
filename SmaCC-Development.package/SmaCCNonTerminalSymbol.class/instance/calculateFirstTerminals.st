accessing
calculateFirstTerminals
	| initialSize |
	initialSize := firstTerminals size.
	productions isEmpty
		ifTrue: [ firstTerminals add: grammar emptySymbol ]
		ifFalse: [ productions
				do: [ :each | firstTerminals addAll: each firstTerminals ] ].
	^ initialSize ~= firstTerminals size