accessing
description
	"Return a textual description of the exception."

	^ String streamContents: [ :stream | | mt |
		(mt := self messageText) isEmptyOrNil
			ifTrue: [ stream << self class name ]
			ifFalse: [ stream << mt ] 
	]