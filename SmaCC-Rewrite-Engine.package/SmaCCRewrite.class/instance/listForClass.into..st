accessing
listForClass: aClass into: aSmaCCRewriteLink
	| next |
	(match canMatch: aClass)
		ifFalse: [ ^ aSmaCCRewriteLink ].
	next := SmaCCRewriteLink new.
	next rewrite: self.
	aSmaCCRewriteLink next: next.
	^ next