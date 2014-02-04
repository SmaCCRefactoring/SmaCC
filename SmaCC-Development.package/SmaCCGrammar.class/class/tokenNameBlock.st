accessing
tokenNameBlock
	^ TokenNameBlock ifNil: [ [ :string | self defaultTokenNameFor: string ] ]