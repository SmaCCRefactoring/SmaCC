actions
findParserClass
	| className class text |
	self scannerClassString isEmpty
		ifTrue: [^ UIManager default inform: 'Undefined scanner class'].
	className := self choose: 'What class do you want to use?' from: (SmaCCParser allSubclasses
					collect: [:c | c name]) asSortedCollection.
	className notNil
		ifTrue: [parserClassMorph hResizing: #rigid.
			parserClassMorph newContents: '';
				 newContents: className.
			parserClassMorph changed: #updateWindowLabel.
			class := Smalltalk at: className asSymbol.
			(class class includesSelector: #parserDefinitionComment)
				ifTrue: [text := self removeCommentedPartOf: (class class sourceCodeAt: #parserDefinitionComment).
					self parserText: text]]