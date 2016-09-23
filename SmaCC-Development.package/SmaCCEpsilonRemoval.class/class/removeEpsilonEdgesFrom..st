algorithm
removeEpsilonEdgesFrom: aSmaCCNode
	"Returns an equivalent graph to aSmaCCNode that doesn't contain any epsilon transitions"

	^ self new removeEpsilonEdgesFrom: aSmaCCNode