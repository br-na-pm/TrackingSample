	VAR CONSTANT

		
		WaitPos : McPointType := (Pos:=(X:=0,Y:=100,Z:=-800)); // in machine frame
		
		TransitionPos_DF : McPointType := (Pos:=(X:=-200,Y:=50,Z:=40)); // DF - Drop Frame
		TransitionPos_MF : McPointType := (Pos:=(X:=-70,Y:=120,Z:=-915)); // MF - Machine Frame
		TransitionPos_PF : McPointType := (Pos:=(X:=50,Y:=150,Z:=60)); 	// PF - Pick Frame
		
		PlaceOffsetPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=30)); 		// in drop frame 
		PlacePos : McPointType := (Pos:=(X:=0,Y:=0,Z:=10));
		
		PickOffsetPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=30));		// in pick frame
		PickPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=10));
	
	END_VAR
	
	VAR {AT 'ProductPla'}
	
		ChoosenPlaceFrame : McTrkFrmIdentType;
		PlacementSelected : BOOL;
		RunPickAndPlace : BOOL;
	
	END_VAR
	
	VAR {AT 'ProductDet'}
	
		ChoosenPickFrame : McTrkFrmIdentType;
		ProductSelected : BOOL;
		RunPickAndPlace : BOOL;
	
	END_VAR

	PROGRAM _MAIN
	
	Feedrate(50000);
	MoveL(WaitPos);
	TrackObject(ChoosenPickFrame, PickOffsetPos);
	MoveL(PickPos);
	WaitTime(1);
	ProductPicked := TRUE;
	MoveL(PickOffsetPos);
	MoveL(TransitionPos_PF);
//	WaitUntilFlush(ChoosenPlaceFrame <> 0); // causes a motion stop
	TrackObject(ChoosenPlaceFrame, PlaceOffsetPos);
	MoveL(PlacePos);
	ProductPlaced := TRUE;
	ProductPicked := FALSE;
	WaitTime(1);
	MoveL(PlaceOffsetPos);	
	ProductPlaced := FALSE;
	TrackStop(MachineFrame, WaitPos);
	
	
	END_PROGRAM
