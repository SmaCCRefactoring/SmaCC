public
readBytesFrom: aSocket
	^aSocket readStream next: aSocket readStream nextDWORD