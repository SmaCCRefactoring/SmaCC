accessing
asString
	| stream |
	stream := WriteStream on: (String new: self size).
	firstSentinel next do: [ :each | each nextPutOn: stream ].
	^ stream contents