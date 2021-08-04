
PROGRAM _INIT
		 	
	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	Conveyor.Enable 	:= TRUE;
	Conveyor.MpLink 	:= ADR(gAxisConvA);
	Conveyor.Parameters := ADR(gConveyorACtrl.Parameter.ConveyorPar);
	
	Conveyor.Power			:= gConveyorACtrl.Cmd.PowerOn;
	Conveyor.Home			:= gConveyorACtrl.Cmd.Home;
	Conveyor.ErrorReset		:= gConveyorACtrl.Cmd.ErrorReset;
	Conveyor.MoveAdditive	:= gConveyorACtrl.Cmd.MoveAdditive;
	Conveyor.MoveAbsolute	:= gConveyorACtrl.Cmd.MoveAbsolute;
	Conveyor.MoveVelocity	:= gConveyorACtrl.Cmd.MoveVelocity;
	Conveyor.Update			:= gConveyorACtrl.Cmd.Update;
	Conveyor.Stop			:= gConveyorACtrl.Cmd.Stop;
	
	IF EDGEPOS(Conveyor.MoveAdditive) THEN
		gConveyorACtrl.Status.PosStartMovement	:= Conveyor.Position;
		gConveyorACtrl.Cmd.MoveAdditive := FALSE;
	END_IF;
	
	Conveyor();
	
	gConveyorACtrl.Status.MovementLeft	:= (gConveyorACtrl.Status.PosStartMovement + gConveyorACtrl.Parameter.ConveyorPar.Distance) - Conveyor.Position;
	gConveyorACtrl.Status.Active		:= Conveyor.Active;
	gConveyorACtrl.Status.Error			:= Conveyor.Error;
	gConveyorACtrl.Status.IsHomed		:= Conveyor.IsHomed;
	gConveyorACtrl.Status.UpdateDone	:= Conveyor.UpdateDone;
	gConveyorACtrl.Status.MoveActive	:= Conveyor.MoveActive;
	gConveyorACtrl.Status.MoveDone		:= Conveyor.MoveDone;
	gConveyorACtrl.Status.PowerOn		:= Conveyor.PowerOn;
	gConveyorACtrl.Status.Position		:= Conveyor.Position;
	gConveyorACtrl.Status.Velocity		:= Conveyor.Velocity;
	
END_PROGRAM

PROGRAM _EXIT
	
	Conveyor.Enable 	:= FALSE;
	Conveyor();
	 
END_PROGRAM

