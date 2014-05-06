tests
testGetCommentInBlankLine
	self
		assert:
			((self parserClass on: (ReadStream on: '#comment'))
				parse;
				yourself) scanner comments asArray = #(#(1 8))