actions
addFiles
	| name |
	name := self
		promptForFile: 'Add file'
		extensions:
			((self model inputParserClass ifNil: [ SmaCCParser ]) fileExtensions
				collect: [ :each | 
					each first = $.
						ifTrue: [ each copyFrom: 2 to: each size ]
						ifFalse: [ each ] ]).
	name isNil
		ifTrue: [ ^ self ].
	self addFiles: (Array with: name)