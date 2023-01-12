private
updateDefinition: aMethodModified

	| text |
	(aMethodModified methodClass == self parserClass class and: [
		 aMethodModified selector == #definitionComment ]) ifFalse: [
		^ self ].
	text := self getCommentsFrom:
		        aMethodModified methodClass >> #definitionComment.
	self definition: text