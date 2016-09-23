private
updateDefinitionFor: parserClass
	| scannerClass source |
	scannerClass := [ parserClass scannerClass ]
		on: Error
		do: [ :ex | ex return: nil ].
	scannerClass notNil
		ifTrue: [ self scannerClassName: scannerClass name ].
	(parserClass class includesSelector: #definitionComment)
		ifTrue: [ source := self removeCommentedPartOf: (parserClass class sourceCodeAt: #definitionComment) ]
		ifFalse:
			[ source := ''.
			(parserClass class includesSelector: #parserDefinitionComment)
				ifTrue: [ source := self removeCommentedPartOf: (parserClass class sourceCodeAt: #parserDefinitionComment) ].
			(scannerClass notNil and: [ scannerClass class includesSelector: #scannerDefinitionComment ])
				ifTrue:
					[ source := (self removeCommentedPartOf: (scannerClass class sourceCodeAt: #scannerDefinitionComment))
						, '\' withCRs , source ] ].
	self definition: source.
	messagesModel text: ''.
	symbolsModel text: ''.
	itemSetsModel text: ''.
	self switchToDefinition