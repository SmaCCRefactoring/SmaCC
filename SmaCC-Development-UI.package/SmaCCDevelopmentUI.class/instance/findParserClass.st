actions
findParserClass
	| className class text |
	self scannerClassString isEmpty
		ifTrue: [ ^ UIManager default inform: 'Undefined scanner class' ].
	className := self
		choose: 'What class do you want to use?'
		from: ((SmaCCParser allSubclasses collect: [ :c | c name ]) reject: [ :c | c = 'SmaCCGLRParser' ]) asSortedCollection.
	className notNil
		ifTrue: [ 
			parserClassMorph hResizing: #rigid.
			parserClassMorph
				newContents: '';
				newContents: className.
			parserClassMorph changed: #updateWindowLabel.
			class := Smalltalk at: className asSymbol.
			(class class includesSelector: #definitionComment)
				ifTrue: [ 
					text := self removeCommentedPartOf: (class class sourceCodeAt: #definitionComment).
					self definition: text ] ]