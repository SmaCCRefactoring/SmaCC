private
setIntervalId
	firstSentinel next do: [:each | currentId := currentId max: each id]