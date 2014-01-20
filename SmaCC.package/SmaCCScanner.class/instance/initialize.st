initialize-release
initialize
	outputStream := WriteStream with: String new.
	lastMatchWasEmpty := true.
	state := #default