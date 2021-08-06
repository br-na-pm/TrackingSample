
PROGRAM _INIT
		 	
	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	Conveyor.Enable 	:= TRUE;
	Conveyor.MpLink 	:= ADR(gAxisConvB);
	Conveyor.Parameters := ADR(gConveyorBCtrl.Parameter.ConveyorPar);
										
	Conveyor.Power			:= gConveyorBCtrl.Cmd.PowerOn;
	Conveyor.Home			:= gConveyorBCtrl.Cmd.Home;
	Conveyor.ErrorReset		:= gConveyorBCtrl.Cmd.ErrorReset;
	Conveyor.MoveAdditive	:= gConveyorBCtrl.Cmd.MoveAdditive;
	Conveyor.MoveAbsolute	:= gConveyorBCtrl.Cmd.MoveAbsolute;
	Conveyor.MoveVelocity	:= gConveyorBCtrl.Cmd.MoveVelocity;
	Conveyor.Update			:= gConveyorBCtrl.Cmd.Update;
	Conveyor.Stop			:= gConveyorBCtrl.Cmd.Stop;
	
	IF EDGEPOS(Conveyor.MoveAdditive) THEN
		gConveyorBCtrl.Status.PosStartMovement	:= Conveyor.Position;
		gConveyorBCtrl.Cmd.MoveAdditive := FALSE;
	END_IF;
	
	Conveyor();
	
	gConveyorBCtrl.Status.MovementLeft	:= (gConveyorBCtrl.Status.PosStartMovement + gConveyorBCtrl.Parameter.ConveyorPar.Distance) - Conveyor.Position;
	gConveyorBCtrl.Status.Active		:= Conveyor.Active;
	gConveyorBCtrl.Status.Error			:= Conveyor.Error;
	gConveyorBCtrl.Status.IsHomed		:= Conveyor.IsHomed;
	gConveyorBCtrl.Status.UpdateDone	:= Conveyor.UpdateDone;
	gConveyorBCtrl.Status.MoveActive	:= Conveyor.MoveActive;
	gConveyorBCtrl.Status.MoveDone		:= Conveyor.MoveDone;
	gConveyorBCtrl.Status.PowerOn		:= Conveyor.PowerOn;
	gConveyorBCtrl.Status.Position		:= Conveyor.Position;
	gConveyorBCtrl.Status.Velocity		:= Conveyor.Velocity;
	
END_PROGRAM

PROGRAM _EXIT
	
	Conveyor.Enable 	:= FALSE;
	Conveyor();
	 
END_PROGRAM

