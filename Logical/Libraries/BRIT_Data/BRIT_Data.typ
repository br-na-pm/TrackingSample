
TYPE
	BRIT_DataParam_typ : 	STRUCT 
		nr_samples : UINT;
	END_STRUCT;
	BRIT_Data_Input_typ : 	STRUCT 
		Data : DINT; (*Units*)
		Time : DINT; (*microsec*)
	END_STRUCT;
	BRIT_Data_IS_typ : 	STRUCT 
		i : UDINT;
		buf_time : ARRAY[0..BRIT_DATA_MAX_SAMPLES_IDX]OF LREAL;
		buf_data : ARRAY[0..BRIT_DATA_MAX_SAMPLES_IDX]OF LREAL;
		nr_samples : UDINT;
		old_data : BRIT_Data_Input_typ;
		avg_x : LREAL;
		avg_y : LREAL;
		cov_xy : LREAL;
		var_xx : LREAL;
		a : LREAL;
		b : LREAL;
		oldEnable : BOOL;
		max_samples : UINT;
		DataOut : LREAL;
		OutTime : LREAL;
		act_idx : UINT;
		prev_idx : UINT;
	END_STRUCT;
END_TYPE
