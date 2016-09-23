private
parserClass
	self parserClassName isEmpty
		ifTrue: [ ^ nil ].
	^ Smalltalk at: self parserClassName asSymbol