converting
asString
	| stream |
	stream := WriteStream on: String new.
	self do: [ :each | stream nextPut: each ].
	^ stream contents