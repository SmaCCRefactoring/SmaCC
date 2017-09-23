accessing
customProjectAttributes
	(Smalltalk at: #AltBrowser ifAbsent: [  ])
		ifNil: [ ^ #(#NoAlt) ]
		ifNotNil: [ ^ #(#Alt) ]