
PROGRAM _INIT
	
	PlacementSelected;
	ChoosenPlaceFrame;
	RunPickAndPlace	:= TRUE;
	gConveyorBCtrl.Parameter.ConveyorPar.Acceleration	:= 200;
	gConveyorBCtrl.Parameter.ConveyorPar.Deceleration	:= 200;
	gConveyorBCtrl.Parameter.ConveyorPar.Distance		:= -400;
	gConveyorBCtrl.Parameter.ConveyorPar.Velocity		:= 5;
	ManualFrameX	:= 0;
	ManualFrameY	:= 0;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	IF gPowerOn THEN
		gDeltaCtrl.Cmd.Home	:= TRUE;
		gDeltaCtrl.Cmd.PowerOn	:= TRUE;
		gConveyorBCtrl.Cmd.Home	:= TRUE;
		gConveyorBCtrl.Cmd.PowerOn	:= TRUE;
	END_IF;
	
	IF EDGEPOS(gRun) THEN	
		ManualCreateFrame := TRUE;
	END_IF	
	
	IF ManualCreateFrame AND TRF_Id_Manual = 0 THEN
		gDeltaCtrl.Status.ProductPlaced := FALSE;
		MC_BR_TrackingFrameCreateManual.Execute	:= TRUE;
		MC_BR_TrackingFrameCreateManual.Parameters.Translation.X			:= ManualFrameX;
		MC_BR_TrackingFrameCreateManual.Parameters.Translation.Y			:= ManualFrameY;
		MC_BR_TrackingFrameCreateManual.Parameters.Translation.Z			:= -985;
		MC_BR_TrackingFrameCreateManual.Parameters.LatchedPath.Position	:= gConveyorBCtrl.Status.Position;
		MC_BR_TrackingFrameCreateManual.TrackingPath	:= ADR(gTrackingPath_Place_R1);
		IF MC_BR_TrackingFrameCreateManual.Done THEN
			MC_BR_TrackingFrameCreateManual.Execute	:= FALSE;
			ManualCreateFrame	:= FALSE;
			TRF_Id_Manual	:= MC_BR_TrackingFrameCreateManual.TrackingFrameID;
		END_IF;
	END_IF;
	
	MC_BR_TrackingFrameCreateManual();
	
	ProductPlaced := gDeltaCtrl.Status.ProductPlaced;
	
	IF TRF_Id_Manual <> 0 THEN
		MC_BR_TrackingPathGetFrames_Plce.Execute		:= TRUE;
		MC_BR_TrackingPathGetFrames_Plce.TrackingPath		:= ADR(gTrackingPath_Place_R1);
		MC_BR_TrackingPathGetFrames_Plce.Parameters.DataAddress	:= ADR(TrkFrmInfo);
		MC_BR_TrackingPathGetFrames_Plce.Parameters.NumberOfFrames	:= 1;
		MC_BR_TrackingPathGetFrames_Plce.Parameters.GetMode	:= mcTRKPATH_GET_MOD_ALL_FRAMES;
		
		IF MC_BR_TrackingPathGetFrames_Plce.Done THEN
			IF (TrkFrmInfo.Distance >= 0 AND TrkFrmInfo.Distance < 800)  THEN
				PlacementSelected	:= TRUE;
				ChoosenPlaceFrame	:= TrkFrmInfo.TrackingFrameID;
			ELSIF (*TrkFrmInfo.Distance > 800 OR *)ProductPlaced THEN
				PlacementSelected		:= FALSE;
				ChoosenPlaceFrame	:= 0;
				DeleteFrame			:= TRUE;
			END_IF;
			MC_BR_TrackingPathGetFrames_Plce.Execute		:= FALSE;
	//		MC_BR_TrackingPathGetFrames_Plce();
		END_IF;
	END_IF;
	
	IF DeleteFrame THEN
		MC_BR_TrackingFrameDelete_0.Execute			:= TRUE;
		MC_BR_TrackingFrameDelete_0.Mode			:= mcTRKFRM_DELETE_MOD_ALL;
		MC_BR_TrackingFrameDelete_0.TrackingPath	:= ADR(gTrackingPath_Place_R1);
//		MC_BR_TrackingFrameDelete_0();
		IF MC_BR_TrackingFrameDelete_0.Done THEN
			MC_BR_TrackingFrameDelete_0.Execute	:= FALSE;
			DeleteFrame		:= FALSE;
	//		ManualCreateFrame := TRUE;
			TRF_Id_Manual	:= 0;
			
		END_IF;
	END_IF;
	
	gPlaceProduct	:= PlacementSelected;
	
	
	MC_BR_TrackingPathGetFrames_Plce();
	MC_BR_TrackingFrameDelete_0();
	ProductPicked;
	ProductPlaced;
	
//	PVIposition[0] := JointAxisPos[0];
//	PVIposition[1] := JointAxisPos[1];
//	PVIposition[2] := JointAxisPos[2];
//	PVIposition[3] := JointAxisPos[3];
//	PVIposition[4] := TrkFrmInfo.CurrentPosition.X -605;
//	PVIposition[5] := TrkFrmInfo.CurrentPosition.Y;
//	PVIposition[6] := -20;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

