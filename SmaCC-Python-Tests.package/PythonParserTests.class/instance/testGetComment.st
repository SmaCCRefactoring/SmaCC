tests
testGetComment
	self
		assert:
			((self parserClass on: (ReadStream on: '__import__("pkg_resources").declare_namespace(__name__) #comment'))
				parse;
				yourself) scanner comments asArray = #(#(57 64))