private
allNodesInto: aCollection
	(aCollection includes: self)
		ifTrue: [ ^ self ].
	aCollection add: self.
	followed notNil
		ifTrue: [ followed allNodesInto: aCollection ].
	directLinks do: [ :each | each allNodesInto: aCollection ]