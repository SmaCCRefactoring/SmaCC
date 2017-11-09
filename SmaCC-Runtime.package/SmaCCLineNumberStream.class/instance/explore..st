accessing
explore: aBlock
	"evaluate aBlock with this stream as argument.  When done, reset my position to the current position."
	
	| savedPosition |
	savedPosition := self position.
	[ ^ aBlock value: self ] ensure: [ self position: savedPosition ]