	VAR CONSTANT

		
		WaitPos : McPointType := (Pos:=(X:=0,Y:=100,Z:=-800));
		
		TransitionPos : McPointType := (Pos:=(X:=-200,Y:=50,Z:=60));
		
		PlaceOffsetPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=30));
		PlacePos : McPointType := (Pos:=(X:=0,Y:=0,Z:=10));
		
		PickOffsetPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=30));
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
//	TrackStop(MachineFrame, WaitPos);
	WaitUntilFlush(ChoosenPlaceFrame <> 0); 
	TrackObject(ChoosenPlaceFrame, TransitionPos);
	MoveL(PlaceOffsetPos);
	MoveL(PlacePos);
	WaitTime(1);
	ProductPicked := FALSE;
	ProductPlaced := TRUE;
	MoveL(PlaceOffsetPos);	
	ProductPlaced := FALSE;
	TrackStop(MachineFrame, WaitPos);
	
	
	END_PROGRAM
