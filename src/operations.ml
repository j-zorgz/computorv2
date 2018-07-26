let add n1 n2 =
	match n1, n2 with
	| (Nbr.RealInteger(i1), Nbr.RealInteger(i2)) -> Nbr.RealInteger(i1 + i2)
	| (Nbr.RealFloat(f1), Nbr.RealFloat(f2)) -> Nbr.RealFloat(f1 +. f2)
	| (Nbr.ComplexNbr(c1), Nbr.ComplexNbr(c2)) -> Complex_calculator.add c1 c2 (* Complex calculator has to define the type of the returned expression *)
	| _ -> failwith "Error add"

let sub n1 n2 =
	match n1, n2 with
	| (Nbr.RealInteger(i1), Nbr.RealInteger(i2)) -> Nbr.RealInteger(i1 - i2)
	| (Nbr.RealFloat(f1), Nbr.RealFloat(f2)) -> Nbr.RealFloat(f1 -. f2)
	| (Nbr.ComplexNbr(c1), Nbr.ComplexNbr(c2)) -> Complex_calculator.sub c1 c2 (* Complex calculator has to define the type of the returned expression *)
	| _ -> failwith "Error sub"

let div n1 n2 =
	match n1, n2 with
	| (Nbr.RealInteger(i1), Nbr.RealInteger(i2)) -> Nbr.RealInteger(i1 / i2)
	| (Nbr.RealFloat(f1), Nbr.RealFloat(f2)) -> Nbr.RealFloat(f1 /. f2)
	| (Nbr.ComplexNbr(c1), Nbr.ComplexNbr(c2)) -> Complex_calculator.div c1 c2 (* Complex calculator has to define the type of the returned expression *)
	| _ -> failwith "Error div"

let mul n1 n2 =
	match n1, n2 with
	| (Nbr.RealInteger(i1), Nbr.RealInteger(i2)) -> Nbr.RealInteger(i1 * i2)
	| (Nbr.RealFloat(f1), Nbr.RealFloat(f2)) -> Nbr.RealFloat(f1 *. f2)
	| (Nbr.ComplexNbr(c1), Nbr.ComplexNbr(c2)) -> Complex_calculator.mul c1 c2 (* Complex calculator has to define the type of the returned expression *)
	| _ -> failwith "Error mul"

let modulus n1 n2 =
	match n1, n2 with
	| (Nbr.RealInteger(i1), Nbr.RealInteger(i2)) -> Nbr.RealInteger(i1 mod i2)
	| (Nbr.RealFloat(f1), Nbr.RealFloat(f2)) -> Nbr.RealFloat (mod_float f1 f2)
	| (Nbr.ComplexNbr(c1), Nbr.ComplexNbr(c2)) -> raise (Types.Execution_error "Can't take the modulus of two complex numbers")
	| _ -> failwith "Error mod"