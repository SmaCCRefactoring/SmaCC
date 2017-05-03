caching
checkCaches
	cacheId ~= self cacheId
		ifTrue: [ self resetCaches.
			self scannerClass initialize.
			cacheId := self cacheId ]