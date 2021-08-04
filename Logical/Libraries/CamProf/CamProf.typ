
TYPE
	CamPolynomialData_typ : 	STRUCT 
		a : REAL;
		b : REAL;
		c : REAL;
		d : REAL;
		e : REAL;
		f : REAL;
		g : REAL;
		x : REAL;
		Reserve : UDINT;
	END_STRUCT;
	CamProfile_typ : 	STRUCT 
		MasterPeriod : DINT;
		SlavePeriod : DINT;
		PolynomialNumber : UDINT;
		PolynomialData : ARRAY[0..MAX_POLYNOMIALS_IDX]OF CamPolynomialData_typ;
	END_STRUCT;
END_TYPE

(**)

TYPE
	AddCamProf_par_typ : 	STRUCT 
		master_start_add : REAL;
		master_add_distance : REAL;
		slave_add_distance : REAL;
		cam_end_position : REAL;
	END_STRUCT;
END_TYPE
