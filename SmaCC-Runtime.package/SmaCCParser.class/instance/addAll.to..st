private
addAll: origCollection to: aCollection
	origCollection isNil ifTrue: [^self].
	origCollection do: [:each | each notNil ifTrue: [aCollection add: each]]