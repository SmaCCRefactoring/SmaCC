accessing
import: aString
	| name rewriteFile |
	name := self directory , aString.
	name asFileReference exists
		ifFalse: [ name := aString ].
	rewriteFile := SmaCCRewriteRuleFileParser parseFile: name.
	self addTransformation: rewriteFile