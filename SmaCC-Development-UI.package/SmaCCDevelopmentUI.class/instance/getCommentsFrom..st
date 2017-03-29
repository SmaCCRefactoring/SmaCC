private
getCommentsFrom: aMethod
	^ String
		streamContents: [ :s | aMethod ast comments do: [ :e | s nextPutAll: e contents asUncommentedCode ] ]
