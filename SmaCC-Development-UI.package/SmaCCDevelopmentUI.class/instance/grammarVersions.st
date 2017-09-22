accessing
grammarVersions
	"Return the list of all the versions of the current grammar, if any."

	| pC |
	pC := self parserClass ifNil: [ ^ #() ].
	(pC class includesSelector: #definitionComment)
		ifTrue: [ SmaCCVersionBrowser
				browseVersionsForMethod: pC class >> #definitionComment ]