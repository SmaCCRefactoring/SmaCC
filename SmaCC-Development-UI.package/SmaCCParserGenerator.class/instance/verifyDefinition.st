private
verifyDefinition
	| definition |
	definition := self definitionCodeHolder contentsMorph text.
	definition string trimBoth isEmpty
		ifTrue: [ 
			UIManager default inform: 'Empty Parser code'.
			self tabList selectedPageIndex: 1.
			^ false ].
	self definitionCodeHolder hasUnacceptedEdits
		ifTrue: [ 
			(self acceptDefinition: definition notifying: self definitionCodeHolder contentsMorph)
				ifTrue: [ 
					self definitionCodeHolder acceptContents: definition.
					self definitionCodeHolder changed: #contents ]
				ifFalse: [ ^ false ] ].
	^ true