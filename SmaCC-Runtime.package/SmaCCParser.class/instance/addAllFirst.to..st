private
addAllFirst: origCollection to: aCollection
	origCollection isNil ifTrue: [^self].
	origCollection reverseDo: [:each | each notNil ifTrue: [aCollection addFirst: each]]