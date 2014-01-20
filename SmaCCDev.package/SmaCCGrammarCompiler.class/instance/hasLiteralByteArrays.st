testing
hasLiteralByteArrays
	"The #hasLiteralByteArrays wasn't meant to be changed without also changing the SmaCCParser #actionForState:and: and #binarySearchIn:for:size: methods. This issue is fixed now and the SmaCCParser can now handle both cases."

	^ true