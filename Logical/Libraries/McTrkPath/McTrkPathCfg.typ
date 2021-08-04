TYPE
	McTPTypEnum :
		( (*Type selector setting*)
		mcTPT_LIN := 0 (*Linear - Linear tracking path*)
		);
	McTPLinMotSrcEnum :
		( (*Motion source selector setting*)
		mcTPTLMS_POS_PROC_VAR := 0, (*Position process variable - Position provided by process variable*)
		mcTPTLMS_AX := 1 (*Axis - Axis*)
		);
	McTPLinMotSrcPosPVMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		VelocityLimit : LREAL; (*Velocity limit in any movement direction [Measurement units/s]*)
		AccelerationLimit : LREAL; (*Acceleration limit in any movement direction [Measurement units/s²]*)
		DecelerationLimit : LREAL; (*Deceleration limit in any movement direction [Measurement units/s²]*)
	END_STRUCT;
	McTPLinMotSrcPosPVType : STRUCT (*Type mcTPTLMS_POS_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Process variable name to get current position*)
		NegativeOverflow : LREAL; (*Positionoverflow in negative direction*)
		PositiveOverflow : LREAL; (*Positionoverflow in positive direction*)
		MovementLimits : McTPLinMotSrcPosPVMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
	END_STRUCT;
	McTPLinMotSrcAxType : STRUCT (*Type mcTPTLMS_AX settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
	END_STRUCT;
	McTPLinMotSrcType : STRUCT (*Source describing the tracking path movement*)
		Type : McTPLinMotSrcEnum; (*Motion source selector setting*)
		PositionProcessVariable : McTPLinMotSrcPosPVType; (*Type mcTPTLMS_POS_PROC_VAR settings*)
		Axis : McTPLinMotSrcAxType; (*Type mcTPTLMS_AX settings*)
	END_STRUCT;
	McTPLinType : STRUCT (*Type mcTPT_LIN settings*)
		MaxTrackingFrames : UINT; (*Maximum number of tracking frames*)
		MotionSource : McTPLinMotSrcType; (*Source describing the tracking path movement*)
	END_STRUCT;
	McTPTypType : STRUCT (*Geometry of tracking path*)
		Type : McTPTypEnum; (*Type selector setting*)
		Linear : McTPLinType; (*Type mcTPT_LIN settings*)
	END_STRUCT;
	McCfgTrkPathType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_TRK_PATH*)
		Type : McTPTypType; (*Geometry of tracking path*)
	END_STRUCT;
END_TYPE