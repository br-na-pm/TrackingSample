
FUNCTION_BLOCK CamCalc (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : BOOL;
		MasterSetSpeed : REAL;
		MasterActPosition : REAL;
		pCamPoly : REFERENCE TO CamProfile_typ;
		SL_Factor : REAL;
		MA_Factor : REAL;
	END_VAR
	VAR_OUTPUT
		SL_Acc : REAL;
		SL_Vel : REAL;
		SL_Pos : REAL;
		Valid : BOOL;
	END_VAR
	VAR
		xStart : REAL;
		x : ARRAY[0..6] OF REAL;
		poly : USINT;
		j : USINT;
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION AddCamProf : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		adrCam : UDINT;
		adrParameter : UDINT;
	END_VAR
END_FUNCTION
