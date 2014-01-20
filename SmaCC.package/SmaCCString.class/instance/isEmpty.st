private
isEmpty
	firstSentinel next do: [:each | each isEmpty ifFalse: [^false]].
	^true