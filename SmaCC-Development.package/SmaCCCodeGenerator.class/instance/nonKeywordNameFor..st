private
nonKeywordNameFor: aString
	| word |
	word := aString.
	[ self keywords includes: word ] whileTrue: [ word := '_' , word ].
	^ word