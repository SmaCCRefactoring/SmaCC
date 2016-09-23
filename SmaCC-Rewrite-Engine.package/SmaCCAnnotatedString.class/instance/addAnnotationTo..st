public
addAnnotationTo: aSmaCCAnnotatedStringInterval
	(node isNil or: [ rule isNil ])
		ifTrue: [ ^ self ].
	aSmaCCAnnotatedStringInterval
		addAnnotation: (SmaCCRewriteAnnotation onNode: node rewrite: rule)