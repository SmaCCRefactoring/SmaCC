generated-comments
parserDefinitionComment

	"goal :	compilation_unit
	;

# 19.3) Lexical Structure.
literal :	<INTEGER_LITERAL>
	|	<FLOATING_POINT_LITERAL>
	|	<BOOLEAN_LITERAL>
#	| 	""true""
#	| 	""false""
	|	<CHARACTER_LITERAL>
	|	<STRING_LITERAL>
	|	<NULL_LITERAL>
	;

# 19.4) Types, Values, and Variables
type	:	primitive_type
	|	reference_type
	;
primitive_type :
		numeric_type
	|	""boolean""
	;
numeric_type:	integral_type
	|	floating_point_type
	;
integral_type : 
		""byte"" 
	|	""short"" 
	|	""int"" 
	|	""long"" 
	|	""char"" 
	;
floating_point_type : 
		""float"" 
	|	""double""
	;

reference_type :
		class_or_interface_type
	|	array_type
	;
class_or_interface_type : name;

class_type :	class_or_interface_type;
interface_type : class_or_interface_type;		

array_type :	primitive_type dims
	|	name dims
	;

# 19.5) Names
name	:	simple_name
	|	qualified_name
	;
simple_name :	<IDENTIFIER>
	;
qualified_name :
		name ""."" <IDENTIFIER>
	;

# 19.6) ""package""s
compilation_unit :
		package_declaration_opt 
		import_declarations_opt
		type_declarations_opt
		;
package_declaration_opt : package_declaration | ;
import_declarations_opt : import_declarations | ;
type_declarations_opt   : type_declarations   | ;

import_declarations : 
		import_declaration
	|	import_declarations import_declaration
	;
type_declarations : 
		type_declaration
	|	type_declarations type_declaration
	;
package_declaration : 
		""package"" name "";""
	;
import_declaration : 
		single_type_import_declaration
	|	type_import_on_demand_declaration
	;
single_type_import_declaration : 
		""import"" name "";""
	;
type_import_on_demand_declaration :
		""import"" name ""."" ""*"" "";""
	;
type_declaration :
		class_declaration
	|	interface_declaration
	|	"";""
	;

# 19.7) Productions used only in the LALR(1) grammar
modifiers_opt:
	|	modifiers
	;
modifiers : 	modifier
	|	modifiers modifier
	;
modifier :	""public"" | ""protected"" | ""private""
	|	""static""
	|	""abstract"" | ""final"" | ""native"" | ""synchronized"" | ""transient"" | ""volatile""
	|	""strictfp"" # note that semantic analysis must check that the
	                 # context of the modifier allows strictfp.
	;

# 19.8) Classes

# 19.8.1) Class Declaration:
class_declaration : 
	modifiers_opt ""class"" <IDENTIFIER> super_opt interfaces_opt class_body
	;
super :	""extends"" class_type
	;
super_opt :	
	|	super
	;
interfaces :	""implements"" interface_type_list
	;
interfaces_opt:
	|	interfaces 
	;
interface_type_list : 
		interface_type
	|	interface_type_list "","" interface_type
	;
class_body :	""{"" class_body_declarations_opt ""}"" 
	;
class_body_declarations_opt : 
	|	class_body_declarations ;
class_body_declarations : 
		class_body_declaration
	|	class_body_declarations class_body_declaration
	;
class_body_declaration :
		class_member_declaration
	|	static_initializer
	|	constructor_declaration
	|	block
	;
class_member_declaration :
		field_declaration
	|	method_declaration
	# repeat the prod for 'class_declaration' here: 
	|	modifiers_opt ""class"" <IDENTIFIER> super_opt interfaces_opt class_body
	|	interface_declaration
	|	"";""
	;

# 19.8.2) Field Declarations
field_declaration : 
		modifiers_opt type variable_declarators "";""
	;
variable_declarators :
		variable_declarator
	|	variable_declarators "","" variable_declarator
	;
variable_declarator :
		variable_declarator_id
	|	variable_declarator_id ""="" variable_initializer
	;
variable_declarator_id :
		<IDENTIFIER>
	|	variable_declarator_id ""["" ""]""
	;
variable_initializer :
		expression
	|	array_initializer
	;

# 19.8.3) Method Declarations
method_declaration :
		method_header method_body
	;
method_header :
		modifiers_opt type method_declarator throws_opt
	|	modifiers_opt ""void"" method_declarator throws_opt
	;
method_declarator :
		<IDENTIFIER> ""("" formal_parameter_list_opt "")""
	|	method_declarator ""["" ""]"" # deprecated
	# be careful; the above production also allows 'void foo() []'
	;
formal_parameter_list_opt :
	|	formal_parameter_list
	;
formal_parameter_list :
		formal_parameter
	|	formal_parameter_list "","" formal_parameter
	;
formal_parameter :
		type variable_declarator_id
	|	""final"" type variable_declarator_id
	;
throws_opt :	
	|	throws
	;
throws :	""throws"" class_type_list
	;
class_type_list :
		class_type
	|	class_type_list "","" class_type
	;
method_body :	block
	|	"";""
	;

# 19.8.4) Static Initializers
static_initializer :
		""static"" block
	;

# 19.8.5) Constructor Declarations
constructor_declaration :
		modifiers_opt constructor_declarator throws_opt 
			constructor_body
	;
constructor_declarator :
		simple_name ""("" formal_parameter_list_opt "")""
	;
constructor_body :
		""{"" explicit_constructor_invocation
			block_statements ""}""
	|	""{"" explicit_constructor_invocation ""}""
	|	""{"" block_statements ""}""
	|	""{"" ""}""
	;
explicit_constructor_invocation :
		""this"" ""("" argument_list_opt "")"" "";""
	|	""super"" ""("" argument_list_opt "")"" "";""
	|	primary ""."" ""this"" ""("" argument_list_opt "")"" "";""
	|	primary ""."" ""super"" ""("" argument_list_opt "")"" "";""
	;

# 19.9) Interfaces

# 19.9.1) Interface Declarations
interface_declaration :
		modifiers_opt ""interface"" <IDENTIFIER> extends_interfaces_opt 
			interface_body
	;
extends_interfaces_opt :
	|	extends_interfaces
	;
extends_interfaces :
		""extends"" interface_type
	|	extends_interfaces "","" interface_type
	;
interface_body :
		""{"" interface_member_declarations_opt ""}""
	;
interface_member_declarations_opt :
	|	interface_member_declarations
	;
interface_member_declarations :
		interface_member_declaration
	|	interface_member_declarations interface_member_declaration
	;
interface_member_declaration :
		constant_declaration
	|	abstract_method_declaration
	|	class_declaration
	|	interface_declaration
	;
constant_declaration :
		field_declaration
	# need to semantically check that modifiers of field declaration
	# include only PUBLIC, ""static"", or ""final"".  Other modifiers are
	# disallowed.
	;
abstract_method_declaration :
		method_header "";""
	;

# 19.10) Arrays
array_initializer :
		""{"" variable_initializers "","" ""}""
	|	""{"" variable_initializers ""}""
	|	""{"" "","" ""}""
	|	""{"" ""}""
	;
variable_initializers :
		variable_initializer
	|	variable_initializers "","" variable_initializer
	;

# 19.11) Blocks and Statements
block :	""{"" block_statements_opt ""}""
	;
block_statements_opt :
	|	block_statements
	;
block_statements :
		block_statement
	|	block_statements block_statement
	;
block_statement :
		local_variable_declaration_statement
	|	statement
	|	class_declaration
	|	interface_declaration
	;
local_variable_declaration_statement :
		local_variable_declaration "";""
	;
local_variable_declaration :
		type variable_declarators
	|	""final"" type variable_declarators
	;
statement :	statement_without_trailing_substatement
	|	labeled_statement
	|	if_then_statement
	|	if_then_else_statement
	|	while_statement
	|	for_statement
	;
statement_no_short_if :
		statement_without_trailing_substatement
	|	labeled_statement_no_short_if
	|	if_then_else_statement_no_short_if
	|	while_statement_no_short_if
	|	for_statement_no_short_if
	;
statement_without_trailing_substatement :
		block
	|	empty_statement
	|	expression_statement
	|	switch_statement
	|	do_statement
	|	break_statement
	|	continue_statement
	|	return_statement
	|	synchronized_statement
	|	throw_statement
	|	try_statement
	;
empty_statement :
		"";""
	;
labeled_statement :
		<IDENTIFIER> "":"" statement
	;
labeled_statement_no_short_if :
		<IDENTIFIER> "":"" statement_no_short_if
	;
expression_statement :
		statement_expression "";""
	;
statement_expression :
		assignment
	|	preincrement_expression
	|	predecrement_expression
	|	postincrement_expression
	|	postdecrement_expression
	|	method_invocation
	|	class_instance_creation_expression
	;
if_then_statement :
		""if"" ""("" expression "")"" statement
	;
if_then_else_statement :
		""if"" ""("" expression "")"" statement_no_short_if 
			""else"" statement
	;
if_then_else_statement_no_short_if :
		""if"" ""("" expression "")"" statement_no_short_if
			""else"" statement_no_short_if
	;
switch_statement :
		""switch"" ""("" expression "")"" switch_block
	;
switch_block :
		""{"" switch_block_statement_groups switch_labels ""}""
	|	""{"" switch_block_statement_groups ""}""
	|	""{"" switch_labels ""}""
	|	""{"" ""}""
	;
switch_block_statement_groups :
		switch_block_statement_group
	|	switch_block_statement_groups switch_block_statement_group
	;
switch_block_statement_group :
		switch_labels block_statements
	;
switch_labels :
		switch_label
	|	switch_labels switch_label
	;
switch_label :
		""case"" constant_expression "":""
	|	""default"" "":""
	;

while_statement :
		""while"" ""("" expression "")"" statement
	;
while_statement_no_short_if :
		""while"" ""("" expression "")"" statement_no_short_if
	;
do_statement :
		""do"" statement ""while"" ""("" expression "")"" "";""
	;
for_statement :
		""for"" ""("" for_init_opt "";"" expression_opt "";""
			for_update_opt "")"" statement
	;
for_statement_no_short_if :
		""for"" ""("" for_init_opt "";"" expression_opt "";""
			for_update_opt "")"" statement_no_short_if
	;
for_init_opt :
	|	for_init
	;
for_init :	statement_expression_list
	|	local_variable_declaration
	;
for_update_opt :
	|	for_update
	;
for_update :	statement_expression_list
	;
statement_expression_list :
		statement_expression
	|	statement_expression_list "","" statement_expression
	;

identifier_opt : 
	|	<IDENTIFIER>
	;

break_statement :
		""break"" identifier_opt "";""
	;

continue_statement :
		""continue"" identifier_opt "";""
	;
return_statement :
		""return"" expression_opt "";""
	;
throw_statement :
		""throw"" expression "";""
	;
synchronized_statement :
		""synchronized"" ""("" expression "")"" block
	;
try_statement :
		""try"" block catches
	|	""try"" block catches_opt finally
	;
catches_opt :
	|	catches
	;
catches :	catch_clause
	|	catches catch_clause
	;
catch_clause :
		""catch"" ""("" formal_parameter "")"" block
	;
finally :	""finally"" block
	;

# 19.12) Expressions
primary :	primary_no_new_array
	|	array_creation_expression
	;
primary_no_new_array :
		literal
	|	""this""
	|	""("" expression "")""
	|	class_instance_creation_expression
	|	field_access
	|	method_invocation
	|	array_access
	|	primitive_type ""."" ""class""
	|	""void"" ""."" ""class""
	|	array_type ""."" ""class""
	|	name ""."" ""class""
	|	name ""."" ""this""
	;
class_instance_creation_expression :
		""new"" class_type ""("" argument_list_opt "")""
	|	""new"" class_type ""("" argument_list_opt "")"" class_body
	|	primary ""."" ""new"" <IDENTIFIER>
			""("" argument_list_opt "")""
	|	primary ""."" ""new"" <IDENTIFIER>
			""("" argument_list_opt "")"" class_body
	;
argument_list_opt :
	|	argument_list
	;
argument_list :
		expression
	|	argument_list "","" expression
	;
array_creation_expression :
		""new"" primitive_type dim_exprs dims_opt
	|	""new"" class_or_interface_type dim_exprs dims_opt
	|	""new"" primitive_type dims array_initializer
	|	""new"" class_or_interface_type dims array_initializer
	;
dim_exprs :	dim_expr
	|	dim_exprs dim_expr
	;
dim_expr :	""["" expression ""]""
	;
dims_opt :
	|	dims
	;
dims :	""["" ""]""
	|	dims ""["" ""]""
	;
field_access :
		primary ""."" <IDENTIFIER>
	|	""super"" ""."" <IDENTIFIER>
	|	name ""."" ""super"" ""."" <IDENTIFIER>
	;
method_invocation :
		name ""("" argument_list_opt "")""
	|	primary ""."" <IDENTIFIER> ""("" argument_list_opt "")""
	|	""super"" ""."" <IDENTIFIER> ""("" argument_list_opt "")""
	|	name ""."" ""super"" ""."" <IDENTIFIER> ""("" argument_list_opt "")""
	;
array_access :
		name ""["" expression ""]""
	|	primary_no_new_array ""["" expression ""]""
	;
postfix_expression :
		primary
	|	name
	|	postincrement_expression
	|	postdecrement_expression
	;
postincrement_expression :
		postfix_expression ""++""
	;
postdecrement_expression :
		postfix_expression ""--""
	;
unary_expression :
		preincrement_expression
	|	predecrement_expression
	|	""+"" unary_expression
	|	""-"" unary_expression
	|	unary_expression_not_plus_minus
	;
preincrement_expression :
		""++"" unary_expression
	;
predecrement_expression :
		""--"" unary_expression
	;
unary_expression_not_plus_minus :
		postfix_expression
	|	""~"" unary_expression
	|	""!"" unary_expression
	|	cast_expression
	;
cast_expression :
		""("" primitive_type dims_opt "")"" unary_expression
	|	""("" expression "")"" unary_expression_not_plus_minus
	|	""("" name dims "")"" unary_expression_not_plus_minus
	;
multiplicative_expression :
		unary_expression
	|	multiplicative_expression ""*"" unary_expression
	|	multiplicative_expression ""/"" unary_expression
	|	multiplicative_expression ""%"" unary_expression
	;
additive_expression :
		multiplicative_expression
	|	additive_expression ""+"" multiplicative_expression
	|	additive_expression ""-"" multiplicative_expression
	;
shift_expression :
		additive_expression
	|	shift_expression ""<<"" additive_expression
	|	shift_expression "">>"" additive_expression
	|	shift_expression "">>>"" additive_expression
	;
relational_expression :
		shift_expression
	|	relational_expression ""<"" shift_expression
	|	relational_expression "">"" shift_expression
	|	relational_expression ""<="" shift_expression
	|	relational_expression "">="" shift_expression
	|	relational_expression ""instanceof"" reference_type
	;
equality_expression :
		relational_expression
	|	equality_expression ""=="" relational_expression
	|	equality_expression ""!="" relational_expression
	;
and_expression :
		equality_expression
	|	and_expression ""&"" equality_expression
	;
exclusive_or_expression :
		and_expression
	|	exclusive_or_expression ""^"" and_expression
	;
inclusive_or_expression :
		exclusive_or_expression
	|	inclusive_or_expression ""|"" exclusive_or_expression
	;
conditional_and_expression :
		inclusive_or_expression
	|	conditional_and_expression ""&&"" inclusive_or_expression
	;
conditional_or_expression :
		conditional_and_expression
	|	conditional_or_expression ""||"" conditional_and_expression
	;
conditional_expression :
		conditional_or_expression
	|	conditional_or_expression ""?"" expression 
			"":"" conditional_expression
	;
assignment_expression :
		conditional_expression
	|	assignment
	;
assignment :	left_hand_side assignment_operator assignment_expression
	;
left_hand_side :
		name
	|	field_access
	|	array_access
	;
assignment_operator :
		""=""
	|	""*=""
	|	""/=""
	|	""%=""
	|	""+=""
	|	""-=""
	|	""<<=""
	|	"">>=""
	|	"">>>=""
	|	""&=""
	|	""^=""
	|	""|=""
	;
expression_opt :
	|	expression
	;
expression :	assignment_expression
	;
constant_expression :
		expression
	;"