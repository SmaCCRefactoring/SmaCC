private
selectorsForProtocol: aString
	"Return all selectors belonging to those protocols"

	"Beware: this is dependent on the fact protocols are strings or symbols"

	^ OrderedCollection
		streamContents: [ :stream | 
			self class withAllSuperclasses
				do: [ :c | 
					c protocols
						do: [ :p | 
							(p matchesRegex: aString)
								ifTrue: [ stream nextPutAll: (c selectorsInProtocol: p) ] ] ] ]
