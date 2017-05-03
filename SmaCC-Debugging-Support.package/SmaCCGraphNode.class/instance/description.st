accessing
description
	| stream |
	previousNodes isEmpty
		ifTrue: [ ^ 'Start' ].
	success
		ifTrue: [ ^ 'Parsing was successful' ].
	stream := WriteStream on: String new.
	reductions asSortedCollection do: [ :each | stream nextPutAll: each ] separatedBy: [ stream cr ].
	^ stream contents