private
supportsUnicodeStrings
	^ [ String with: (Character value: 16rFF00).
	true ]
		on: Error
		do: [ :ex | ex return: false ]