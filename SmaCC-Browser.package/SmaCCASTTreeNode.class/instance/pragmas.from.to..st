as yet unclassified
pragmas: aSymbol from: aClass to: aTarget
	"A safe way to find pragmas in a class hierarchy."

	| pragmas |
	pragmas := OrderedCollection new.
	(aClass allSelectorsBelow: aTarget superclass)
		do: [ :selector | pragmas addAll: ((aClass lookupSelector: selector) pragmas select: [ :pragma | pragma key == aSymbol ]) ].
	^ pragmas