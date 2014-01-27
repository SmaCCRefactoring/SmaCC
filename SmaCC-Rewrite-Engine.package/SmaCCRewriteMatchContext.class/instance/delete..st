private
delete: anObject
	| start stop |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	self deleteFrom: start to: stop