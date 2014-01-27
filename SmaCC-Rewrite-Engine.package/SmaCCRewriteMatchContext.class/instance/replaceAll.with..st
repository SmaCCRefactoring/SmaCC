private
replaceAll: aCollection with: aString
	aCollection do: [:each | self replace: each with: aString]