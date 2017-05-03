instance creation
on: aStream
	| parser scanner |
	self checkCaches.
	scanner := self scannerClass on: aStream.
	parser := self new.
	parser scanner: scanner.
	^ parser