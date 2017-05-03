public
on: aStream
	| parser scanner |
	scanner := self scannerClass on: aStream.
	scanner parseOpt: true.
	parser := self new.
	parser scanner: scanner.
	^ parser