accessing
sourceFor: aString

	aString asFileReference readStreamDo: [ : stream |
		^ ([ #[239 187 191] allSatisfy: [ :each | stream peekFor: (Character value: each) ] ]
			on: Error
			do: [ :ex | ex return: false ])
				ifFalse: [ stream position: 0 ].	"HACK to handle UTF-8 streams" ]