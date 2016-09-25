running
commonParentDirectory
	| common |
	commonParentDirectory notNil
		ifTrue: [ ^ commonParentDirectory ].
	(self files isEmpty or: [ self createSubdirectories not ])
		ifTrue: [ ^ '' ].
	common := self files first asFileReference parent pathString.
	self files
		do:
			[ :each | 
			[ each beginsWith: common ]
				whileFalse:
					[ common := (common isEmpty or: [ common size = 3 and: [ (common at: 2) = $: ] ])
						ifTrue: [ '' ]
						ifFalse: [ (common copyFrom: 1 to: common size - 1) asFileReference parent
								pathString ] ] ].
	^ common