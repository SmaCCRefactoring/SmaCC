private
copyStackObject: anObject
	(anObject isKindOf: String) ifTrue: [^anObject].
	(anObject isKindOf: Collection) ifTrue: [^anObject collect: [:each | self copyStackObject: each]].
	(anObject isKindOf: SmaCCParseNode) ifTrue: [^anObject copy].
	^anObject