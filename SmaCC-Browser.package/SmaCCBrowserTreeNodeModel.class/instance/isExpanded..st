protocol
isExpanded: aBoolean
	"When not expanded, destroy its contents. Too much caching hurts."

	aBoolean
		ifFalse: [ contents := nil ]