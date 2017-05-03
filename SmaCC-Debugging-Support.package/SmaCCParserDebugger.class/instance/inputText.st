private
inputText
	| stream |
	stream := self parser scanner stream.
	^ ((stream isKindOf: PositionableStream) or: [ stream isKindOf: SmaCCLineNumberStream ])
		ifTrue: [ stream contents ]
		ifFalse: [ '' ]