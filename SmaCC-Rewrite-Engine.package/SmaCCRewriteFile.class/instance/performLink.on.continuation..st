public
performLink: aSmaCCRewriteLink on: aSmaCCNode continuation: aBlock
	| link continuation |
	link := aSmaCCRewriteLink.
	continuation := [self
		performLink: link next
		on: aSmaCCNode
		continuation: aBlock].
	[link notNil]
		whileTrue:
			[(link rewrite performOn: aSmaCCNode continuation: continuation) ifTrue: [^true].
			link := link next].
	^aBlock value