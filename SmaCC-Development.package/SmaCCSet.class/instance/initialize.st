initialize
initialize
	super initialize.
	characters := ByteArray new: 16r10000 / 8.
	objects := Set new