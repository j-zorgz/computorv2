let rec computorv2 (state:(string, Entity.definable) Hashtbl.t) =
	print_string "> " ;
	let line = read_line () in
	let lexed_line = Lexer.lexer line in
	Utils.print_lex_lst lexed_line ;
	let parsed_line = Parser.parser lexed_line in
	begin
		match parsed_line with
		| Entity.FunctionDefinition (name, parameter, expr) ->
			print_endline ("Defining function " ^ name ^ " with variable " ^ parameter ^ " and expression : ") ;
			Utils.print_entity_lst expr ;
			Hashtbl.replace state name (Entity.Func(new Entity.func_obj parameter expr))
		| Entity.VariableDefinition (name, expr) ->
		begin
			print_endline ("Defining variable " ^ name ^ " = "); Utils.print_entity_lst expr ;
			let nbr = Resolve.resolve expr state in
			Utils.print_nbr nbr ;
			Hashtbl.replace state name (Entity.Variable(nbr))
		end
		| Entity.ExpressionSolving expr -> Utils.print_nbr (Resolve.resolve expr state)
		| _ -> print_endline "Not yet handled" ;
	end ;
	computorv2 state

let () =
	let state = Hashtbl.create 32 in
	try computorv2 state with
		| End_of_file -> print_endline "Goodbye."
