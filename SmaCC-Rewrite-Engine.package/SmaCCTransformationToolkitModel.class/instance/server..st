accessing
server: aString
	server := aString.
	modified := true.
	self trigger: #server with: aString