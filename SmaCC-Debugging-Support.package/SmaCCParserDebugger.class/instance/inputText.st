private
inputText
	| stream |
	stream := self parser scanner stream.
	^ (stream isKindOf: PositionableStream)
		ifTrue: [ stream contents ]
		ifFalse: [ '' ]