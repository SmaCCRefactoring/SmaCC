private
supportsLargeValues
	[ Character value: 1000 ]
		on: Error
		do: [ :ex | ^ false ].
	^ true