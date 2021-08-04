	VAR CONSTANT

		
		WaitPos : McPointType := (Pos:=(X:=0,Y:=100,Z:=-800));
		
		PlaceOffsetPos : McPointType := (Pos:=(X:=0,Y:=300,Z:=-800));
		PlacePos : McPointType := (Pos:=(X:=0,Y:=300,Z:=-900));
		
		PickOffsetPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=30));
		PickPos : McPointType := (Pos:=(X:=0,Y:=0,Z:=10));
	
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
	TrackStop(MachineFrame, PlaceOffsetPos);
	MoveL(PlacePos);
	WaitTime(1);
	MoveL(PlaceOffsetPos);
	ProductPicked := FALSE;
	ProductPlaced := TRUE;
	MoveL(WaitPos);
	ProductPlaced := FALSE;
	
	END_PROGRAM
