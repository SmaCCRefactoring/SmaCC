private
saveRule: aString in: selection
	RBParser parseExpression: aString onError: [ :msg :pos | ^ self inform: 'Code does not parse' ].
	self save: aString into: selection