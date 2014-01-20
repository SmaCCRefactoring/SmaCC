accessing
calculateFirstTerminals
	| initialSize |
	initialSize := firstItems size.
	productions isEmpty 
		ifTrue: [firstItems add: self class empty]
		ifFalse: [productions do: [:each | firstItems addAll: each firstTerminals]].
	^initialSize ~= firstItems size