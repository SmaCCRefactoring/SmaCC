compiling
compileMethodWithoutFormattingIn: modelClass
	| code |
	code := self codeStream contents.
	code := code trim.
	modelClass compile: code classified: #generated