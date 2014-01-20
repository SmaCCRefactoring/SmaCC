actions
findScannerClass
	| className class text |
	className := self choose: 'What class do you want to use?' from: (SmaCCScanner allSubclasses
					collect: [:c | c name]) asSortedCollection.
	className notNil
		ifTrue: [scannerClassMorph newContents: '';
				 newContents: className.
			scannerClassMorph changed: #updateWindowLabel.
			class := Smalltalk at: className asSymbol.
			(class class includesSelector: #scannerDefinitionComment)
				ifTrue: [text := self removeCommentedPartOf: (class class sourceCodeAt: #scannerDefinitionComment).
							self scannerText: text]]