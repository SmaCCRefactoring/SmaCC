generated
attribute: aDelphiMethodAttributeNode
	self attribute notNil
		ifTrue: [ self attribute parent: nil ].
	attribute := aDelphiMethodAttributeNode.
	self attribute notNil
		ifTrue: [ self attribute parent: self ]