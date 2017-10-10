accessing
errorToken
	"My error token."

	^ self object errorToken
		ifNotNil: [ :aToken | AltSmaCCTokenDescription on: aToken in: self object ]