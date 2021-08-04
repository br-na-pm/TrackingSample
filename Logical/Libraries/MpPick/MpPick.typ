
TYPE
	MpPickRegObjPosIdType :UDINT;
 (*Identifier for a position in a pick register (object or placeholder)*)	MpPickObjectTypeIdentType :UDINT;
 (*Represents an object type defined in a PickObjectList configuration*)	MpPickCoreComponentStateEnum :
		(
		mcPICK_CORE_STARTUP, (*Component is in startup state*)
		mcPICK_CORE_DISABLED, (*Component is in disabled state*)
		mcPICK_CORE_STANDBY, (*Component is in standby state*)
		mcPICK_CORE_STARTED, (*Component is in started state*)
		mcPICK_CORE_ERRORSTOP, (*Component is in error stop state*)
		mcPICK_CORE_INVALID_CONFIG (*Component is in invalid configuration state*)
		);
	MpPickCoreInfoType : 	STRUCT
		ComponentState : MpPickCoreComponentStateEnum; (*Current PickCore component state*)
		Diag : MpPickDiagType; (*Internal information*)
	END_STRUCT;
	MpPickCoreParType : 	STRUCT
		OperationMode : STRING[80]; (*Name of the operation mode in which the PickCore component is to be started*)
	END_STRUCT;
	MpPickCoreType : 	STRUCT
		controlif : REFERENCE TO MpInternalPickCoreIfType;
		mappLinkInternal : McInternalMappLinkType;
	END_STRUCT;
	MpPickDiagType : 	STRUCT
		StatusID : MpPickStatusIDType; (*StatusID evaluation (internal)*)
	END_STRUCT;
	MpPickErrorEnum :
		(
		mcPICK_NO_ERROR := 0, (* No error *)
		mcPICK_ERR_ACTIVATION := -1064239103, (* Could not create component [Error: 1, 0xc0910001] *)
		mcPICK_ERR_MPLINK_NULL := -1064239102, (* MpLink is NULL pointer [Error: 2, 0xc0910002] *)
		mcPICK_ERR_MPLINK_INVALID := -1064239101, (* MpLink connection not allowed [Error: 3, 0xc0910003] *)
		mcPICK_ERR_MPLINK_CHANGED := -1064239100, (* MpLink modified [Error: 4, 0xc0910004] *)
		mcPICK_ERR_MPLINK_CORRUPT := -1064239099, (* Invalid MpLink contents [Error: 5, 0xc0910005] *)
		mcPICK_ERR_MPLINK_IN_USE := -1064239098, (* MpLink already in use [Error: 6, 0xc0910006] *)
		mcPICK_ERR_COMMAND_FAILED := -1066334208, (* Command failed [Error: 7, 0xc0710800] *)
		mcPICK_ERR_PROCESS_FAILED := -1066334203 (* A component error occurred during operation [Error: 8, 0xc0710805] *)
		);
	MpPickObjectListType : 	STRUCT
	END_STRUCT;
	MpPickObjLatchedConvType : 	STRUCT
		Position : LREAL; (*Latched conveyor position at the time the translation and orientation was determined. This parameter is ignored on 'Static' PickRegisters*)
	END_STRUCT;
	MpPickObjPosInfoType : 	STRUCT
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		Translation : McPosType; (*Translation of current position to the specified frame*)
		Orientation : McOrientType; (*Orientation of current position to the specified frame*)
		ObjectTypeIdent : MpPickObjectTypeIdentType; (*Defines the object type which can be picked or placed from/on the object position*)
		ObjectAttachment : UDINT; (*Attachment of the object assigned to this object position*)
		IsPlaceholder : BOOL; (*FALSE when an object is on the position. TRUE when it is only a placeholder for a certain object type*)
	END_STRUCT;
	MpPickRegCreateObjectsParType : 	STRUCT
		DataAddress : UDINT; (*Address of MpPickRegCreateObjectParType array*)
		NumberOfObjects : UINT; (*Maximum number of objects to be created. NumberOfObjects <= number of objects in DataAddress array*)
	END_STRUCT;
	MpPickRegCreateObjectParType : 	STRUCT
		Mode : MpPickRegCreateObjModeEnum; (*Object creation mode*)
		ObjectTypeName : STRING[250]; (*Name of the object type which can be picked or placed from/on the object position*)
		LatchedConveyor : MpPickObjLatchedConvType; (*Parameters for latched conveyor position*)
		Translation : McPosType; (*Translation of the object position to the PickRegister frame*)
		Orientation : McOrientType; (*Orientation of the object position to the PickRegister frame*)
		ObjectAttachment : UDINT; (*Attachment for the object created on this object position. This property will be ignored, when only a placeholder is to be created*)
	END_STRUCT;
	MpInternalPickRegisterIfType : 	STRUCT
		vtable : DWORD;
	END_STRUCT;
	MpPickRegCreateObjModeEnum :
		(
		mpPICK_CREATE_SINGLEITEM, (*Creates a single item position with a single item object (placeholder and object of a certain type)*)
		mpPICK_CREATE_CONTAINER_FULL, (*Creates a container position with a filled container object (placeholder, object (of container type) and content of a certain single item type)*)
		mpPICK_CREATE_CONTAINER_EMPTY, (*Creates a container position with an empty container object (placeholder and object of a certain type)*)
		mpPICK_CREATE_CONTAINER_PLACEH, (*Creates a container position only. Placeholder for a certain container type to be placed*)
		mpPICK_CREATE_SINGLEITEM_PLACEH (*Creates a single item position only. Placeholder for a certain single item type to be placed*)
		);
	MpPickRegDeleteObjectsParType : 	STRUCT
		Mode : MpPickRegDeleteObjModeEnum; (*Object deletion mode*)
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		ObjectTypeName : STRING[250]; (*Name of the object type which can be picked or placed from/on the object position*)
	END_STRUCT;
	MpPickRegDeleteObjModeEnum :
		(
		mpPICK_DEL_ALL, (*Deletes all items (objects and placeholders)*)
		mpPICK_DEL_ALL_OBJECTS_OF_TYPE, (*Deletes all objects of a specified type*)
		mpPICK_DEL_ALL_PLACEH_OF_TYPE, (*Deletes all placeholders of a specified type*)
		mpPICK_DEL_ALL_SINGLEITEMS, (*Deletes all single items*)
		mpPICK_DEL_ALL_SINGLEITEM_PLACEH, (*Deletes all single item placeholders*)
		mpPICK_DEL_ALL_CONTAINERS, (*Deletes all containers*)
		mpPICK_DEL_ALL_CONTAINER_PLACEH, (*Deletes all container placeholders*)
		mpPICK_DEL_ALL_OBJECTS, (*Deletes all single items and containers*)
		mpPICK_DEL_ALL_PLACEHOLDERS, (*Deletes all single item or container placeholders*)
		mpPICK_DEL_ALL_FULL_CONTAINERS, (*Deletes all full containers*)
		mpPICK_DEL_ALL_EMPTY_CONTAINERS, (*Deletes all empty containers*)
		mpPICK_DEL_CERTAIN_ITEM, (*Deletes a single item or container with a certain ID (objects and placeholders)*)
		mpPICK_DEL_CONTAINER_CONTENT (*Deletes the content of a container with a certain ID*)
		);
	MpPickRegGetObjectsParType : 	STRUCT
		GetMode : MpPickRegGetObjModeEnum; (*Mode for getting objects*)
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		ObjectTypeName : STRING[250]; (*Name of the object type which can be picked or placed from/on the object position*)
		CoordSystem : UDINT; (*Frame in which translation and orientation of the object positions is to be determined. 0 specifies the PickRegister frame*)
		DataAddress : UDINT; (*Address to MpPickObjPosInfoType array*)
		NumberOfObjectPositions : UINT; (*Maximum number of objects to be read. NumberOfObjects <= number of objects in DataAddress array*)
	END_STRUCT;
	MpPickRegGetObjModeEnum :
		(
		mpPICK_GET_ALL, (*Get all items (objects and placeholders)*)
		mpPICK_GET_ALL_OBJECTS_OF_TYPE, (*Get all objects of a specified type*)
		mpPICK_GET_ALL_PLACEH_OF_TYPE, (*Get all placeholders of a specified type*)
		mpPICK_GET_ALL_SINGLEITEMS, (*Get all single items*)
		mpPICK_GET_ALL_SINGLEITEM_PLACEH, (*Get all single item placeholders*)
		mpPICK_GET_ALL_CONTAINERS, (*Get all containers*)
		mpPICK_GET_ALL_CONTAINER_PLACEH, (*Get all container placeholders*)
		mpPICK_GET_ALL_OBJECTS, (*Get all single items and containers*)
		mpPICK_GET_ALL_PLACEHOLDERS, (*Get all single item or container placeholders*)
		mpPICK_GET_ALL_FULL_CONTAINERS, (*Get all full containers*)
		mpPICK_GET_ALL_EMPTY_CONTAINERS, (*Get all empty containers*)
		mpPICK_GET_CERTAIN_ITEM, (*Get an item with a certain ID*)
		mpPICK_GET_CONTAINER_CONTENT (*Get the content of a container with a certain ID*)
		);
	MpPickRegisterComponentStateEnum :
		(
		mcPICK_REGISTER_STARTUP, (*Component is in startup state*)
		mcPICK_REGISTER_DISABLED, (*Component is in disabled state*)
		mcPICK_REGISTER_READY, (*Component is in ready state*)
		mcPICK_REGISTER_ERRORSTOP, (*Component is in error stop state*)
		mcPICK_REGISTER_INVALID_CONFIG (*Component is in invalid configuration state*)
		);
	MpPickRegisterInfoType : 	STRUCT
		ComponentState : MpPickRegisterComponentStateEnum; (*Current PickRegister component state*)
		NumberOfObjects : UINT; (*Current number of created objects (A full container is considered as one created object)*)
		Diag : MpPickDiagType; (*Internal information*)
	END_STRUCT;
	MpPickRegisterType : 	STRUCT
		controlif : REFERENCE TO MpInternalPickRegisterIfType;
		mappLinkInternal : McInternalMappLinkType;
	END_STRUCT;
	MpPickRegSetObjectParType : 	STRUCT
		ObjectPositionId : MpPickRegObjPosIdType; (*Identifier for the position in the PickRegister*)
		ObjectAttachment : UDINT; (*Data to be attached to the object assigned to the specified object position*)
	END_STRUCT;
	MpInternalPickCoreIfType : 	STRUCT
		vtable : DWORD;
	END_STRUCT;
	MpPickStatusIDType : 	STRUCT
		ID : MpPickErrorEnum; (*Message ID*)
		Severity : MpComSeveritiesEnum; (*Message severity*)
		Code : UINT; (*Message code*)
	END_STRUCT;
END_TYPE
