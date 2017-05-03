private
addFileRuleTo: aRewriteFile
	| rewrite filename |
	aRewriteFile isNil
		ifTrue: [ ^ self ].
	filename := UITheme current
		chooseFullFileNameIn: UITheme builder
		title: 'Enter rewrite rule file name'
		extensions: #('rw')
		path: nil
		preview: nil.
	filename isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewriteFile new filename: filename.
	self addRewrite: rewrite to: aRewriteFile