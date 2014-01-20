private
matchingCharacters
	^SmaCCGrammar ignoreCase 
		ifTrue: [characters reject: [:each | each isLowercase]]
		ifFalse: [characters]