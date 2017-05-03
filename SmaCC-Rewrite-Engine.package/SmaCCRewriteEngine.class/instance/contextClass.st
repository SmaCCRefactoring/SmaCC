accessing
contextClass
	contextClass isNil
		ifTrue: [ contextClass := Class new
				superclass: SmaCCRewriteMatchContext;
				setFormat: SmaCCRewriteMatchContext format;
				classLayout: SmaCCRewriteMatchContext classLayout copy;
				yourself.
			self rewriteRule updateClass: contextClass ].
	^ contextClass