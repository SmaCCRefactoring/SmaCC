running
readBytes
	^ serverStream
		next:
			serverStream next + (serverStream next << 8) + (serverStream next << 16)
				+ (serverStream next << 24)