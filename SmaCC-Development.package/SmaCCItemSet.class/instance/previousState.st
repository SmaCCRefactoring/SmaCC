accessing
previousState
	"Pick some previous item set"

	previousItemSets isEmpty
		ifTrue: [ ^ nil ].
	^ previousItemSets first