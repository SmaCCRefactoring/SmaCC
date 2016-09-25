private
keywords
	^ keywords
		ifNil:
			[ keywords := #(#break #do #instanceof #typeof #case #else #var #catch #finally #return #void #continue #for #switch #while #debugger #function #this #with #default #if #throw #delete #in #try)
				asSet collect: [ :each | each asString ] ]