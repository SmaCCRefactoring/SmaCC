accessing
safe: aBlock
	"Used to track also a stack overflow, but I'm not sure Pharo is sending that."

	^ aBlock
		on: Error
		do: [ :ex | ex return ]