accessing
safe: aBlock
	^ aBlock
		on: Error
		do: [ :ex | ex return ]