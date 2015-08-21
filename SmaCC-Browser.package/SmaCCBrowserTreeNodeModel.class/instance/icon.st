accessing
icon
	"When returned an icon symbol, sees if it exists before trying to get it. We depend on some packages which may not exist or be unloaded."

	| iconSelector |
	iconSelector := self item icon.
	iconSelector ifNil: [ ^ nil ].
	(Smalltalk ui icons respondsTo: iconSelector)
		ifTrue: [ ^ Smalltalk ui icons perform: iconSelector ]
		ifFalse: [ ^ nil ]