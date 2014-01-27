accessing
import: aFileReference
	| name rewriteFile |
	name := self directory / aFileReference.
	name exists
		ifFalse: [ name := aFileReference ].
	rewriteFile := SmaCCRewriteRuleFileParser parseFile: name.
	self addTransformation: rewriteFile