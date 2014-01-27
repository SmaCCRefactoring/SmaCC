accessing
engine
	rewriteEngine isNil
		ifTrue: [ 
			rewriteEngine := SmaCCRewriteEngine new.
			rewriteEngine rewriteRule: self rules ].
	^ rewriteEngine