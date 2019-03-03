private
verifyDefinition
	| definition |
	definition := definitionTextModel text.
	definition string trimBoth isEmpty
		ifTrue: [ UIManager default inform: 'Empty Parser code'.
			self tabList selectedPageIndex: 1.
			^ false ].
	^ self acceptDefinition: definition