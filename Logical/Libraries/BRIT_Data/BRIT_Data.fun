
{REDUND_ERROR} FUNCTION_BLOCK BRIT_DataPredict (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL;
		ErrorReset : {REDUND_UNREPLICABLE} BOOL;
		Parameters : {REDUND_UNREPLICABLE} BRIT_DataParam_typ;
		DataIn : {REDUND_UNREPLICABLE} BRIT_Data_Input_typ; (*encoder signal expected growing positive )overflow management*)
		OutTime : {REDUND_UNREPLICABLE} DINT; (*microsec*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL;
		Error : {REDUND_UNREPLICABLE} BOOL;
		Valid : {REDUND_UNREPLICABLE} BOOL;
		DataOut : {REDUND_UNREPLICABLE} DINT; (*units*)
	END_VAR
	VAR
		IS : BRIT_Data_IS_typ;
	END_VAR
END_FUNCTION_BLOCK
