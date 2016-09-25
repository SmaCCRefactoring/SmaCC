public
addAnnotation: aSmaCCRewriteAnnotation
	| collection |
	collection := self annotations.
	(collection notEmpty
		and: [ collection last = aSmaCCRewriteAnnotation ])
		ifTrue: [ ^ self ].
	collection add: aSmaCCRewriteAnnotation