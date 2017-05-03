accessing
readerPrototype
	^ Reader ifNil: [ Reader := SmaCCRewriteMatchContext compiledMethodFor: 'selector ^Uninitialized' ]