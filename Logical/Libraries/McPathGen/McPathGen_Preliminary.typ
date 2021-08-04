TYPE
	McPathGenTrackingStateEnum :
		(
		mcPATHGEN_TS_NO_TRACKING := 0, (*Not tracking*)
		mcPATHGEN_TS_SYNCHRONIZING := 1, (*Synchronizing*)
		mcPATHGEN_TS_SYNCHRONIZED := 2, (*Synchronized*)
		mcPATHGEN_TS_DESYNCHRONIZING := 3 (*Desynchronizing*)
		);

	McPathGenTrackedObjTypeEnum :
		(
		mcPATHGEN_TS_NO_OBJECT := 0, (*No object to track*)
		mcPATHGEN_TS_TRACKING_PATH := 1, (*Tracked object is a tracking path*)
		mcPATHGEN_TS_AXES_GROUP := 2, (*Tracked object is an axes group*)
		mcPATHGEN_TS_TRAK := 3 (*Tracked object is a track*)
		);

	McPathGenTrackingInfoType :	STRUCT
		TrackedObject : McPathGenTrackedObjectType; (*info tracked object*)
		TrackedFrame : McPathGenTrackedFrameType; (*info tracked frame*)
		ErrorStruct : McPathGenErrorStructType; (*geometric error*)
		EstimatedCalculationTime : McPathGenEstimatedCalcTimeType; (*calculation time*)
	END_STRUCT;

	McPathGenTrackedObjectType : 	STRUCT
		ObjectType : McPathGenTrackedObjTypeEnum; (*Kind of tracked object*)
		TrackedTrkPath : McTrackingPathType; (*The tracking path reference establishes the connection between the function block and the tracking path.*)
	END_STRUCT;

	McPathGenTrackedFrameType : 	STRUCT
		FrameId: UDINT; (*Id of tracking frame*)
	END_STRUCT;

	McPathGenErrorStructType : 	STRUCT
		ActualError : LREAL; (*Actual geometric tracking error*)
	END_STRUCT;

	McPathGenEstimatedCalcTimeType: 	STRUCT
		Time: LREAL; (*Estimated calculation time*)
	END_STRUCT;

END_TYPE
