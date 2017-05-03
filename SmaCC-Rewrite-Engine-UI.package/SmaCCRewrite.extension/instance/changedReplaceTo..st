*smacc-rewrite-engine-ui
changedReplaceTo: aSymbol
	| class rewrite |
	class := SmaCCRewriteTransformation withAllSubclasses detect: [ :each | each type = aSymbol ].
	self transformation class == class
		ifTrue: [ ^ self ].
	rewrite := class new.
	self transformation: rewrite