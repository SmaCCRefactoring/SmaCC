menus
contents: aStringOrText notifying: aRequestor
	| result |
	self ownerAcceptSelector notNil
		ifTrue: [ result := self owner perform: self ownerAcceptSelector with: aStringOrText with: aRequestor ]
		ifFalse: [ result := true ].
	result
		ifTrue: [ 
			self acceptContents: aStringOrText.
			^ true ].
	^ false