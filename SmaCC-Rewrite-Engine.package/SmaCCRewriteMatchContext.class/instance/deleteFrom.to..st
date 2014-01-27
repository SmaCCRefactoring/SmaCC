private
deleteFrom: start to: stop
	| startIndex stopIndex |
	startIndex := self startIndexFor: start.
	stopIndex := self stopIndexFor: stop.
	(startIndex isNil or: [stopIndex isNil]) ifTrue: [^self].
	self source deleteFrom: startIndex to: stopIndex