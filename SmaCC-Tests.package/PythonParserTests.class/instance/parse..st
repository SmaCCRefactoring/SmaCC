accessing
parse: aSource
	| parser |
	parser := self parserClass on: (ReadStream on: aSource).
	^ parser parse