accessing
sourceFrom: first to: last
	^ (self source
		copyFrom: (self startIndexFor: first)
		to: (self stopIndexFor: last)) asString