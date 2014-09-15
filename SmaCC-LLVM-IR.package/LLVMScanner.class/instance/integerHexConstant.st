private
integerHexConstant
	"Return an integer constant. In smalltalk, this will be just an integer, with a type which says over 64 bits / below 64 bits, signed or unsigned."

	| i |
	i := Number readFrom: '16r' , (outputStream contents allButFirst: 3).	"Starts with u0x"
	matchActions := Array
		with:
			(i > 16rFfffFfffFfffFffff
				ifTrue: [ self EUAPINTVALId ]
				ifFalse: [ self EUINT64VALId ]).
	^ self createTokenFor: outputStream contents