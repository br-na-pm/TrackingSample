
PROGRAM _INIT
	
	JointPar.Homing.Mode			:= mcHOMING_DIRECT;
	
	
	gDeltaCtrl.Parameter.Override	:= 100;
	gDeltaCtrl.Parameter.DeltaPar.ProgramName	:= 'PickPlace.st';
	
END_PROGRAM

PROGRAM _CYCLIC
	
	IF JointQ1.Active AND JointQ2.Active AND JointQ3.Active AND JointQC.Active THEN
		DeltaRobot4Ax.Enable		:= TRUE;
		DeltaRobot4Ax.MpLink 		:= ADR(Rob1_4ax);
		DeltaRobot4Ax.Parameters 	:= ADR(gDeltaCtrl.Parameter.DeltaPar);
		DeltaRobot4Ax.Override		:= gDeltaCtrl.Parameter.Override;
	END_IF;
	
	DeltaRobot4Ax.MoveProgram	:= gDeltaCtrl.Cmd.MoveProgram;
	DeltaRobot4Ax.Home			:= gDeltaCtrl.Cmd.Home;
	DeltaRobot4Ax.Power			:= gDeltaCtrl.Cmd.PowerOn;
	DeltaRobot4Ax.Stop			:= gDeltaCtrl.Cmd.Stop;
	DeltaRobot4Ax.ErrorReset	:= gDeltaCtrl.Cmd.ErrorReset;
	DeltaRobot4Ax.Interrupt		:= gDeltaCtrl.Cmd.Interrupt;
	DeltaRobot4Ax.Continue		:= gDeltaCtrl.Cmd.Continue;
	
	JointQ1.Enable 		:= TRUE;
	JointQ1.MpLink 		:= ADR(gR1_AxisQ1);
	JointQ1.Parameters 	:= ADR(JointPar);

	JointQ2.Enable 		:= TRUE;
	JointQ2.MpLink 		:= ADR(gR1_AxisQ2);
	JointQ2.Parameters 	:= ADR(JointPar);

	JointQ3.Enable 		:= TRUE;
	JointQ3.MpLink 		:= ADR(gR1_AxisQ3);
	JointQ3.Parameters 	:= ADR(JointPar);

	JointQC.Enable 		:= TRUE;
	JointQC.MpLink 		:= ADR(gR1_AxisQC);
	JointQC.Parameters 	:= ADR(JointPar);	
	
	// Call of FUBs
	JointQ1();
	JointQ2();
	JointQ3();
	JointQC();
	DeltaRobot4Ax();
	
	IF EDGEPOS(gPickProduct) AND DeltaRobot4Ax.PowerOn AND DeltaRobot4Ax.IsHomed THEN
		gDeltaCtrl.Cmd.MoveProgram 	:= TRUE;
	END_IF;
	
	IF DeltaRobot4Ax.MoveDone AND gDeltaCtrl.Cmd.MoveProgram THEN
		gDeltaCtrl.Cmd.MoveProgram	:= FALSE;
	END_IF;
		
	// Update status parameter of ctrl structure
	gDeltaCtrl.Status.Active			:= DeltaRobot4Ax.Active;
	gDeltaCtrl.Status.Error				:= DeltaRobot4Ax.Error;
	gDeltaCtrl.Status.IsHomed			:= DeltaRobot4Ax.IsHomed;
	gDeltaCtrl.Status.MoveActive		:= DeltaRobot4Ax.MoveActive;
	gDeltaCtrl.Status.MoveDone			:= DeltaRobot4Ax.MoveDone;
	gDeltaCtrl.Status.PowerOn			:= DeltaRobot4Ax.PowerOn;
	gDeltaCtrl.Status.MoveInterrupted	:= DeltaRobot4Ax.MoveInterrupted;
	gDeltaCtrl.Status.Stopped			:= DeltaRobot4Ax.Stopped;
	gDeltaCtrl.Status.InMotion			:= DeltaRobot4Ax.InMotion;
	gDeltaCtrl.Status.InterruptStatus	:= DeltaRobot4Ax.Info.Program.InterruptStatus;
	
	JointAxisPos[0] := ( DeltaRobot4Ax.Info.JointAxisPosition[0] );
	JointAxisPos[1] := ( DeltaRobot4Ax.Info.JointAxisPosition[1] );
	JointAxisPos[2] := ( DeltaRobot4Ax.Info.JointAxisPosition[2] );
	JointAxisPos[3] := ( DeltaRobot4Ax.Info.JointAxisPosition[3] );
	
END_PROGRAM

PROGRAM _EXIT
	
	DeltaRobot4Ax.Enable	:= FALSE;
	DeltaRobot4Ax();
	JointQ1.Enable			:= FALSE;
	JointQ1();
	JointQ2.Enable			:= FALSE;
	JointQ2();
	JointQ3.Enable			:= FALSE;
	JointQ3();
	JointQC.Enable			:= FALSE;
	JointQC();
	 
END_PROGRAM

