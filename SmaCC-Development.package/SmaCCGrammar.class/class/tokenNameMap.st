accessing
tokenNameMap
	^ TokenNameMap ifNil: [ TokenNameMap := self defaultTokenNameMap ]