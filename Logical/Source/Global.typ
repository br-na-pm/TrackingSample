(*********** Delta ***********)

TYPE
	DeltaCtrl_type : 	STRUCT 
		Cmd : DeltaCtrlCmd_type;
		Status : DeltaCtrlStatus_type;
		Parameter : DeltaCtrlParameter_type;
	END_STRUCT;
	DeltaCtrlCmd_type : 	STRUCT 
		PowerOn : BOOL;
		Home : BOOL;
		MoveProgram : BOOL;
		Stop : BOOL;
		ErrorReset : BOOL;
		Interrupt : BOOL;
		Continue : BOOL;
	END_STRUCT;
	DeltaCtrlStatus_type : 	STRUCT 
		Active : BOOL;
		Error : BOOL;
		PowerOn : BOOL;
		IsHomed : BOOL;
		MoveActive : BOOL;
		MoveDone : BOOL;
		Stopped : BOOL;
		InMotion : BOOL;
		ProductPicked : BOOL;
		ProductPlaced : BOOL;
		MoveInterrupted : BOOL;
		ProductInRange : BOOL;
		InterruptStatus : McPrgInfoInterruptEnum;
	END_STRUCT;
	DeltaCtrlParameter_type : 	STRUCT 
		Override : REAL;
		DeltaPar : MpDelta4AxisParType;
	END_STRUCT;
END_TYPE

(*********** Conveyor ***********)

TYPE
	ConveyorCtrl_type : 	STRUCT 
		Cmd : ConveyorCtrlCmd_type;
		Status : ConveyorCtrlStatus_type;
		Parameter : ConveyorCtrlParameter_type;
	END_STRUCT;
	ConveyorCtrlCmd_type : 	STRUCT 
		PowerOn : BOOL;
		Home : BOOL;
		MoveAdditive : BOOL;
		MoveAbsolute : BOOL;
		MoveVelocity : BOOL;
		ErrorReset : BOOL;
		Stop : BOOL;
		Update : BOOL;
	END_STRUCT;
	ConveyorCtrlStatus_type : 	STRUCT 
		Active : BOOL;
		Error : BOOL;
		PowerOn : BOOL;
		IsHomed : BOOL;
		MoveActive : BOOL;
		MoveDone : BOOL;
		Position : LREAL;
		Velocity : REAL;
		MovementLeft : LREAL;
		PosStartMovement : LREAL;
		UpdateDone : BOOL;
	END_STRUCT;
	ConveyorCtrlParameter_type : 	STRUCT 
		ConveyorPar : MpAxisBasicParType;
	END_STRUCT;
END_TYPE
