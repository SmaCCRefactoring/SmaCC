menus
contents: aStringOrText notifying: aRequestor

	| result |
	self ownerAcceptSelector
		ifNotNil: [
			result := self owner
				          perform: self ownerAcceptSelector
				          with: aStringOrText
				          with: aRequestor ]
		ifNil: [ result := true ].
	result ifTrue: [
		self contents: aStringOrText.
		^ true ].
	^ false