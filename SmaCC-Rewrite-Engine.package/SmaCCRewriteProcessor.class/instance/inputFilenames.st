accessing
inputFilenames
	| names |
	names := OrderedCollection new.
	(self inputDirectory asFileReference
		allChildrenMatching: '*' , self extension)
		do: [ :each | names add: each path ].
	^ names