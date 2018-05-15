private
updateDefinition: aMethodModified
	"If our definition is updated, then we need to reset the contents of the definition. Expected use case: the user has reverted to a previous version of the grammar definition."

	(aMethodModified methodClass == self parserClass class
		and: [ aMethodModified selector == #definitionComment ])
		ifTrue: [ | text |
			text := self
				getCommentsFrom: aMethodModified methodClass >> #definitionComment.
			self definition: text ]