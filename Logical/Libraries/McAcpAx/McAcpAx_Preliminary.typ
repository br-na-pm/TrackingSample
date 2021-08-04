TYPE

	McAcpAxAdvCtrlParType : STRUCT
		LoopFilter1 : McAcpAxLoopFilterParType; (*Structure for loop filter 1 of the axis*)
		LoopFilter2 : McAcpAxLoopFilterParType; (*Structure for loop filter 2 of the axis*)
		LoopFilter3 : McAcpAxLoopFilterParType; (*Structure for loop filter 3 of the axis*)
	END_STRUCT;

	McAcpAxCtrlParType : STRUCT
		Mode : McAcpAxCtrlModeEnum; (*Controller mode*)
		PositionController : McAcpAxPosCtrlParType; (*Structure of the parameters for the position controller*)
		SpeedController : McAcpAxSpeedCtrlParType; (*Structure of the parameters for the velocity controller*)
		FeedForward : McAcpAxFeedForwardParType; (*Structure of the parameters for feed-forward control*)
		ParameterSelector : McAcpAxCtrlParSelectEnum; (*Used for selecting the parameter sets that are to be transferred to the axis when there is a rising edge on input "Execute"*)
	END_STRUCT;

	McAcpAxAutoTuneFeedFwdType : STRUCT
		Direction : McDirectionEnum; (*Used for selecting the direction of movement for autotuning the feed-forward control*)
	    Orientation : McAcpAxAutoTuneOrientationEnum; (*Selects the orientation for autotuning*)
	    MaxDistance : LREAL; (*Maximum distance traveled during autotuning [Measurement units]*)
	    MaxPositionError : LREAL; (*Maximum permitted lag error during autotuning[Measurement units]*)
	    Velocity : REAL; (*Maximum velocity that is used during autotuning [Measurement units/s]*)
	    Acceleration : REAL; (*Acceleration that is used during autotuning [Measurement units/s]*)
	    MaxCurrentPercent : REAL; (*Percentage of the rated current that is used during autotuning [%]*)
	    MaxVelocityPercent : REAL; (*Percentage of the velocity used during autotuning [%]*)
	END_STRUCT;

	McAcpAxAutoTuneFeedFwdOutType : STRUCT
		Quality : REAL; (*Quality of parameter identification [%]*)
		FeedForward : McAcpAxFeedForwardParType; (*Parameter for first control loop filter*)
	END_STRUCT;

END_TYPE
