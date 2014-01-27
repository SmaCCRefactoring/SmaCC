public
commonParentDirectory
	| common |
	(self files isEmpty or: [ self createSubdirectories not ])
		ifTrue: [ ^ '' ].
	common := self files first parent.
	self files
		do: [ :each | 
			[ common containsReference: each ]
				whileFalse: [ 
					common := common isEmpty
						ifTrue: [ common ]
						ifFalse: [ common parent ] ] ].
	^ common