TYPE
	MpPCGripEnum :
		( (*Gripper selector setting*)
		mcPCG_STD := 0 (*Standard - Standard gipper to pick one or multiple objects at once*)
		);
	MpPCGripStdToolEnum :
		( (*Tool selector setting*)
		mcPCGST_AX_GRP := 0 (*Axes group - The Tool is considered in mechanical system or axes group configuration*)
		);
	MpPCGripStdToolType : STRUCT
		Type : MpPCGripStdToolEnum; (*Tool selector setting*)
	END_STRUCT;
	MpPCGripStdOpCloseEnum :
		( (*Open/Close selector setting*)
		mcPCGSOC_TIME_BASED := 0 (*Time based - Configuration of basic gripper control based on time*)
		);
	MpPCGripStdOpCloseTimeBasedType : STRUCT (*Type mcPCGSOC_TIME_BASED settings*)
		CloseTime : REAL; (*Time delay between sending the signal to close gripper and an actually closed gripper [s]*)
		OpenTime : REAL; (*Time delay between sending the signal to open gripper and an actually opened gripper [s]*)
		ProcessVariableName : STRING[250]; (*Process variable for gripper open/close control*)
	END_STRUCT;
	MpPCGripStdOpCloseType : STRUCT (*Open/close behavior of the gripper*)
		Type : MpPCGripStdOpCloseEnum; (*Open/Close selector setting*)
		TimeBased : MpPCGripStdOpCloseTimeBasedType; (*Type mcPCGSOC_TIME_BASED settings*)
	END_STRUCT;
	MpPCGripStdType : STRUCT (*Type mcPCG_STD settings*)
		Tool : MpPCGripStdToolType;
		OpenClose : MpPCGripStdOpCloseType; (*Open/close behavior of the gripper*)
	END_STRUCT;
	MpPCGripType : STRUCT
		Type : MpPCGripEnum; (*Gripper selector setting*)
		Standard : MpPCGripStdType; (*Type mcPCG_STD settings*)
	END_STRUCT;
	MpPCJobMoveEnum :
		( (*Movement selector setting*)
		mcPCJM_BASIC := 0 (*Basic -*)
		);
	MpPCJobMoveBasicType : STRUCT (*Type mcPCJM_BASIC settings*)
		PickOffsetZ : LREAL; (*Z-offset relative to coordinate system of pick-and-place object [Measurement units]*)
		PlaceOffsetZ : LREAL; (*Z-offset relative to coordinate system of pick-and-place object [Measurement units]*)
		RoundingEdgeRadius : LREAL; (*Radius of rounding sphere [Measurement units]*)
	END_STRUCT;
	MpPCJobMoveType : STRUCT
		Type : MpPCJobMoveEnum; (*Movement selector setting*)
		Basic : MpPCJobMoveBasicType; (*Type mcPCJM_BASIC settings*)
	END_STRUCT;
	MpPCJobLimEnum :
		( (*Limits selector setting*)
		mcPCJL_NOT_USE := 0, (*Not used -*)
		mcPCJL_BASIC := 1 (*Basic -*)
		);
	MpPCJobLimBasicLimType : STRUCT
		Velocity : LREAL; (*[Measurement units/s]*)
		Acceleration : LREAL; (*[Measurement units/s²]*)
		Deceleration : LREAL; (*[Measurement units/s²]*)
	END_STRUCT;
	MpPCJobLimBasicType : STRUCT (*Type mcPCJL_BASIC settings*)
		WithObject : MpPCJobLimBasicLimType;
		WithoutObject : MpPCJobLimBasicLimType;
	END_STRUCT;
	MpPCJobLimType : STRUCT
		Type : MpPCJobLimEnum; (*Limits selector setting*)
		Basic : MpPCJobLimBasicType; (*Type mcPCJL_BASIC settings*)
	END_STRUCT;
	MpCfgPickJobType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_JOB*)
		Name : STRING[250]; (*Name of the pick-and-place job*)
		ObjectName : STRING[250]; (*Pick-and-place object name defined in pick-and-place object list*)
		InfeedRegisterReference : McCfgReferenceType; (*Register from which the objects have to be picked*)
		OutfeedRegisterReference : McCfgReferenceType; (*Register to which the objects have to be placed*)
		Movement : MpPCJobMoveType;
		Limits : MpPCJobLimType;
	END_STRUCT;
	MpPCOMAJProcEnum :
		( (*Processing selector setting*)
		mcPCOMAJP_FIFO := 0, (*FIFO - Prefer objects which have first entered the register queue*)
		mcPCOMAJP_INFEED_OUTFEED := 1 (*Infeed Outfeed - Choose combination of advanced infeed/outfeed processing strategies based on your process requirements*)
		);
	MpPCOMAJProcInOutFeedPrfType : STRUCT (*Define processing strategy for the infeed Register of the assigned job*)
		FirstRegistered : BOOL; (*Prefer objects which were first entering the pick-and-place register*)
		FirstLeavingWorkspace : BOOL; (*Prefer objects which are leaving robot workspace first*)
		ShortestProcessingTime : BOOL; (*Prefer objects which are consuming the shortest processing time*)
		ShortestDistance : BOOL; (*Prefer objects which are consuming the shortest movement distance*)
	END_STRUCT;
	MpPCOMAJProcInOutfeedType : STRUCT (*Type mcPCOMAJP_INFEED_OUTFEED settings*)
		InfeedPreferences : MpPCOMAJProcInOutFeedPrfType; (*Define processing strategy for the infeed Register of the assigned job*)
		OutfeedPreferences : MpPCOMAJProcInOutFeedPrfType; (*Define processing strategy for the outfeed Register of the assigned job*)
	END_STRUCT;
	MpPCOMAJProcType : STRUCT (*Define a processing strategy for the objects in the queue of the assigned registers*)
		Type : MpPCOMAJProcEnum; (*Processing selector setting*)
		InfeedOutfeed : MpPCOMAJProcInOutfeedType; (*Type mcPCOMAJP_INFEED_OUTFEED settings*)
	END_STRUCT;
	MpPCOMAJExeBxEnum :
		( (*Job execution behaviour selector setting*)
		mcPCOMAJJEB_WAIT_PLH := 0, (*Wait placeholder - Only picks the object when it can be placed immediately*)
		mcPCOMAJJEB_ALW_PICK := 1 (*Always pick - Always picks the object. When it cannot be placed immediately, the robot moves to a waiting position and waits for a placeholder*)
		);
	MpPCOMAJEBAPWaitBxEnum :
		( (*Waiting behavior selector setting*)
		mcPCOMAJEBAPWB_MOVE_FIX_POS := 0 (*Movement fixed position -*)
		);
	MpPCOMAJEBAPWBMFPPosEnum :
		( (*Position selector setting*)
		mcPCOMAJEBAPWBMFPP_STD := 0 (*Standard - Define a PickCore internal position relative to a standard frame in the object hierarchy*)
		);
	MpPCOMAJEBAPWBMFPPosStdType : STRUCT (*Type mcPCOMAJEBAPWBMFPP_STD settings*)
		FrameName : STRING[250]; (*Name of Frame defined in object hierarchy or frame hierarchy of an axes group*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	MpPCOMAJEBAPWBMFPPosType : STRUCT (*Type of position source*)
		Type : MpPCOMAJEBAPWBMFPPosEnum; (*Position selector setting*)
		Standard : MpPCOMAJEBAPWBMFPPosStdType; (*Type mcPCOMAJEBAPWBMFPP_STD settings*)
	END_STRUCT;
	MpPCOMAJEBAPWaitBxMoveFixPosType : STRUCT (*Type mcPCOMAJEBAPWB_MOVE_FIX_POS settings*)
		Position : MpPCOMAJEBAPWBMFPPosType; (*Type of position source*)
	END_STRUCT;
	MpPCOMAJEBAPWaitBxType : STRUCT (*Defines the action of the robot when the picked object cannot be placed*)
		Type : MpPCOMAJEBAPWaitBxEnum; (*Waiting behavior selector setting*)
		MovementFixedPosition : MpPCOMAJEBAPWaitBxMoveFixPosType; (*Type mcPCOMAJEBAPWB_MOVE_FIX_POS settings*)
	END_STRUCT;
	MpPCOMAJExeBxAlwPickType : STRUCT (*Type mcPCOMAJJEB_ALW_PICK settings*)
		WaitingBehavior : MpPCOMAJEBAPWaitBxType; (*Defines the action of the robot when the picked object cannot be placed*)
	END_STRUCT;
	MpPCOMAJExeBxType : STRUCT (*Behavior of the robot when only a pick position but no place position is available*)
		Type : MpPCOMAJExeBxEnum; (*Job execution behaviour selector setting*)
		AlwaysPick : MpPCOMAJExeBxAlwPickType; (*Type mcPCOMAJJEB_ALW_PICK settings*)
	END_STRUCT;
	MpPCOpModAsgJobType : STRUCT
		Name : McCfgString250Type;
		Priority : UINT; (*Defines priority of the assigned job in case more than one assigned job is available. The highest priority is 10. The lowest priority is 1*)
		Processing : MpPCOMAJProcType; (*Define a processing strategy for the objects in the queue of the assigned registers*)
		JobExecutionBehaviour : MpPCOMAJExeBxType; (*Behavior of the robot when only a pick position but no place position is available*)
	END_STRUCT;
	MpPCOpModJobSchedEnum :
		( (*Job scheduling selector setting*)
		mcPCOMJS_ALT := 0, (*Alternating - Robot will alternate between all assigned jobs based on the order above*)
		mcPCOMJS_PRF_CHEAP := 1 (*Prefer cheapest - Out of the available jobs the robot will take the job with the lowest costs (based on the processing strategies defined at the assigned jobs)*)
		);
	MpPCOpModJobSchedType : STRUCT (*Scheduling of how robot should alternate between the assigned jobs in case more jobs with the same priority are available*)
		Type : MpPCOpModJobSchedEnum; (*Job scheduling selector setting*)
	END_STRUCT;
	MpPCOpModIdleBxEnum :
		( (*Idle behavior selector setting*)
		mcPCOMIB_FIX_WAIT_POS := 0 (*Fixed waiting position -*)
		);
	MpPCOMIBSFWPEnum :
		( (*Position selector setting*)
		mcPCOMIBSFWP_STD := 0 (*Standard - Define a PickCore internal position relative to a standard frame in the object hierarchy*)
		);
	MpPCOMIBSFWPStdType : STRUCT (*Type mcPCOMIBSFWP_STD settings*)
		FrameName : STRING[250]; (*Name of Frame defined in object hierarchy or frame hierarchy of an axes group*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	MpPCOMIBSFWPType : STRUCT (*Type of position source*)
		Type : MpPCOMIBSFWPEnum; (*Position selector setting*)
		Standard : MpPCOMIBSFWPStdType; (*Type mcPCOMIBSFWP_STD settings*)
	END_STRUCT;
	MpPCOpModIdleBxFixWaitPosType : STRUCT (*Type mcPCOMIB_FIX_WAIT_POS settings*)
		Position : MpPCOMIBSFWPType; (*Type of position source*)
	END_STRUCT;
	MpPCOpModIdleBxType : STRUCT (*Behavior of robot when no pick-and-place objects available for performing one of the assigned jobs*)
		Type : MpPCOpModIdleBxEnum; (*Idle behavior selector setting*)
		FixedWaitingPosition : MpPCOpModIdleBxFixWaitPosType; (*Type mcPCOMIB_FIX_WAIT_POS settings*)
	END_STRUCT;
	MpCfgPickOpModType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_OP_MOD*)
		Name : STRING[250];
		AssignedJob : ARRAY[0..9] OF MpPCOpModAsgJobType;
		JobScheduling : MpPCOpModJobSchedType; (*Scheduling of how robot should alternate between the assigned jobs in case more jobs with the same priority are available*)
		IdleBehavior : MpPCOpModIdleBxType; (*Behavior of robot when no pick-and-place objects available for performing one of the assigned jobs*)
	END_STRUCT;
	MpCfgPickCoreType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_CORE*)
		AxesgroupReference : McCfgReferenceType; (*Name of the axesgroup reference*)
		Gripper : MpPCGripType;
		Job : McCfgUnboundedArrayType;
		OperationMode : McCfgUnboundedArrayType;
	END_STRUCT;
	MpPRTypEnum :
		( (*Type selector setting*)
		mcPRT_STAT_POS := 0, (*Static position -*)
		mcPRT_LIN_CNVR := 1 (*Linear conveyor -*)
		);
	MpPRTypStatPosType : STRUCT (*Type mcPRT_STAT_POS settings*)
		FrameName : STRING[250]; (*Name of standard frame defined in object hierarchy*)
	END_STRUCT;
	MpPRTLCMSEnum :
		( (*Motion source selector setting*)
		mcPRTLCMS_POS_PROC_VAR := 0, (*Position process variable - Position process variable*)
		mcPRTLCMS_AX := 1 (*Axis - Axis*)
		);
	MpPRTLCMSPosProcVarMoveLimType : STRUCT (*Velocity, acceleration and deceleration limits to be considered*)
		VelocityLimit : LREAL; (*Velocity limit in any movement direction [Measurement units/s]*)
		AccelerationLimit : LREAL; (*Acceleration limit in any movement direction [Measurement units/s²]*)
		DecelerationLimit : LREAL; (*Deceleration limit in any movement direction [Measurement units/s²]*)
	END_STRUCT;
	MpPRTLCMSPosProcVarType : STRUCT (*Type mcPRTLCMS_POS_PROC_VAR settings*)
		ProcessVariableName : STRING[250]; (*Input: Process variable for describing the current position of the conveyor axis cyclically*)
		NegativeOverflow : LREAL; (*Overflow of the position process variable in negative direction*)
		PositiveOverflow : LREAL; (*Overflow of the position process variable in positive direction*)
		MovementLimits : MpPRTLCMSPosProcVarMoveLimType; (*Velocity, acceleration and deceleration limits to be considered*)
	END_STRUCT;
	MpPRTLCMSAxType : STRUCT (*Type mcPRTLCMS_AX settings*)
		AxisReference : McCfgReferenceType; (*Name of the axis reference*)
	END_STRUCT;
	MpPRTLCMSType : STRUCT (*Source describing the conveyor movement*)
		Type : MpPRTLCMSEnum; (*Motion source selector setting*)
		PositionProcessVariable : MpPRTLCMSPosProcVarType; (*Type mcPRTLCMS_POS_PROC_VAR settings*)
		Axis : MpPRTLCMSAxType; (*Type mcPRTLCMS_AX settings*)
	END_STRUCT;
	MpPRTypLinCnvrType : STRUCT (*Type mcPRT_LIN_CNVR settings*)
		FrameName : STRING[250]; (*Name of standard frame defined in object hierarchy*)
		Length : LREAL; (*Length of the conveyor (Along the x-direction of the defined standard frame). At the end of the conveyor all created place holders will be deleted.*)
		Width : LREAL; (*Width of the conveyor (Along the y-direction of the defined standard frame)*)
		Height : LREAL; (*Height of the register (Along the z-direction of the defined standard frame). Defines the maximum offset in z-direction for objects to be created*)
		ObjectCount : UDINT; (*Maximum number of pick-and-place objects and pick-and-place object placeholders*)
		MotionSource : MpPRTLCMSType; (*Source describing the conveyor movement*)
	END_STRUCT;
	MpPRTypType : STRUCT
		Type : MpPRTypEnum; (*Type selector setting*)
		StaticPosition : MpPRTypStatPosType; (*Type mcPRT_STAT_POS settings*)
		LinearConveyor : MpPRTypLinCnvrType; (*Type mcPRT_LIN_CNVR settings*)
	END_STRUCT;
	MpCfgPickRegType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_REG*)
		Type : MpPRTypType;
	END_STRUCT;
	MpPOLObjEnum :
		( (*Object '{/}' selector setting*)
		mcPOLO_SNG_ITEM := 0, (*Single item - Single pick-and-place item*)
		mcPOLO_CNTR := 1 (*Container - Physical or virtual container for pick-and-place objects. A container can be picked and placed as well. A container without a mass defines only the layout of pick-and-place objects*)
		);
	MpPOLObjSngItemType : STRUCT (*Type mcPOLO_SNG_ITEM settings*)
		Name : STRING[250]; (*Name of the pick-and-place object*)
	END_STRUCT;
	MpPOLObjCntrLyrPosType : STRUCT
		Object : McCfgString250Type; (*Pick-and-place object assigned to this position*)
		Translation : McCfgTransXYZType; (*Translation parameters*)
		Orientation : McCfgOrientType; (*Orientation parameters*)
	END_STRUCT;
	MpPOLObjCntrLyrType : STRUCT (*Fill the container: Layer n+1 is only available if layer n was already filled. Empty the container: Layer n is only available when n+1 was emptied*)
		Position : McCfgUnboundedArrayType;
	END_STRUCT;
	MpPOLObjCntrType : STRUCT (*Type mcPOLO_CNTR settings*)
		Name : STRING[250]; (*Name of the pick-and-place object*)
		Layer : McCfgUnboundedArrayType; (*Fill the container: Layer n+1 is only available if layer n was already filled. Empty the container: Layer n is only available when n+1 was emptied*)
	END_STRUCT;
	MpPOLObjType : STRUCT
		Type : MpPOLObjEnum; (*Object '{/}' selector setting*)
		SingleItem : MpPOLObjSngItemType; (*Type mcPOLO_SNG_ITEM settings*)
		Container : MpPOLObjCntrType; (*Type mcPOLO_CNTR settings*)
	END_STRUCT;
	MpCfgPickObjLstType : STRUCT (*Main data type corresponding to McCfgTypeEnum mcCFG_PICK_OBJ_LST*)
		Object : McCfgUnboundedArrayType;
	END_STRUCT;
END_TYPE