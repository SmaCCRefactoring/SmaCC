accessing
writerPrototype
	^ Writer ifNil: [ Writer := SmaCCRewriteMatchContext compiledMethodFor: 'selector: anObject ^Uninitialized := anObject' ]