instance creation
on: aStream
	| parser scanner |
	scanner := self scannerClass on: aStream.
	parser := self new.
	parser scanner: scanner.
	^ parser