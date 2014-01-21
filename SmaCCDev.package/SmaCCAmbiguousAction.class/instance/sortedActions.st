accessing
sortedActions
	"When in doubt shift the token"

	^actions asSortedCollection: [:a :b | a id <= b id]