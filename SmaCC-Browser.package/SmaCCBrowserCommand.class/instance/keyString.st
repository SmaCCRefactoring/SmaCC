accessing
keyString
	"Note: printing is broken on KeyCombination."
	
	| c |
	^ (c := self keystroke) isNil
		ifFalse: [ (String streamContents: [ :stream | c printOn: stream ]) copyWithout: Character space ]
		ifTrue: [ nil ]