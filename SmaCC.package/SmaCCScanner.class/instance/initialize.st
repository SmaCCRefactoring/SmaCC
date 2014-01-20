initialize
initialize
	super initialize.
	outputStream := WriteStream with: String new.
	lastMatchWasEmpty := true.
	state := #default.
	comments := OrderedCollection new