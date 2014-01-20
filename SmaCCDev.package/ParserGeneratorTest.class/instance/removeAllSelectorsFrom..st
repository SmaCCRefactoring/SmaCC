private
removeAllSelectorsFrom: aClass 
	aClass selectors do: [ :each | aClass removeSelector: each ].
	aClass organization removeEmptyCategories