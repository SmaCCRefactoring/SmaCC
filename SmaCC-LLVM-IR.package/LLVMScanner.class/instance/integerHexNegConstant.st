private
integerHexNegConstant
	"Return an integer constant. In smalltalk, this will be just an integer, with a type which says over 64 bits / below 64 bits, signed or unsigned."

	| i |
	i := Number readFrom: '16r' , (outputStream contents allButFirst: 3).	"Starts with s0x"
	matchActions := Array
		with:
			(i < -16r8000000000000000
				ifTrue: [ self ESAPINTVALId ]
				ifFalse: [ self ESINT64VALId ]).
	^ self createTokenFor: outputStream contents