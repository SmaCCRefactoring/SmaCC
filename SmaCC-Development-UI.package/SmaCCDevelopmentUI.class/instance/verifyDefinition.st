private
verifyDefinition
	| definition |
	definition := self definitionCodeHolder contentsMorph text.
	definition string trimBoth isEmpty
		ifTrue: [ UIManager default inform: 'Empty Parser code'.
			self tabList selectedPageIndex: 1.
			^ false ].
	self definitionCodeHolder hasUnacceptedEdits
		ifTrue: [ (self
				acceptDefinition: definition
				notifying: self definitionCodeHolder contentsMorph)
				ifTrue: [ self definitionCodeHolder contents: definition.
					self definitionCodeHolder contentsMorph text = definition
						ifFalse: [ self definitionCodeHolder changed: #contents ]
						ifTrue: [ self definitionCodeHolder clearUserEditFlag ] ]
				ifFalse: [ ^ false ] ].
	^ true