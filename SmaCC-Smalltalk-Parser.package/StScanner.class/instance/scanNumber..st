scanning
scanNumber: id
	| number |
	number := Number readFrom: stream.
	outputStream reset.
	matchActions := Array with: id.
	^ self createTokenFor: number