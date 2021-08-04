/* Automation Studio generated header file */
/* Do not edit ! */
/* MpPick 5.16.9 */

#ifndef _MPPICK_
#define _MPPICK_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MpPick_VERSION
#define _MpPick_VERSION 5.16.9
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif
 
#ifdef _SG3
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif
 
#ifdef _SGC
#include <McBase.h> 
#include <McTrkPath.h> 
#include <MpBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum MpPickCoreComponentStateEnum
{	mcPICK_CORE_STARTUP,
	mcPICK_CORE_DISABLED,
	mcPICK_CORE_STANDBY,
	mcPICK_CORE_STARTED,
	mcPICK_CORE_ERRORSTOP,
	mcPICK_CORE_INVALID_CONFIG
} MpPickCoreComponentStateEnum;

typedef enum MpPickErrorEnum
{	mcPICK_NO_ERROR = 0,
	mcPICK_ERR_ACTIVATION = -1064239103,
	mcPICK_ERR_MPLINK_NULL = -1064239102,
	mcPICK_ERR_MPLINK_INVALID = -1064239101,
	mcPICK_ERR_MPLINK_CHANGED = -1064239100,
	mcPICK_ERR_MPLINK_CORRUPT = -1064239099,
	mcPICK_ERR_MPLINK_IN_USE = -1064239098,
	mcPICK_ERR_COMMAND_FAILED = -1066334208,
	mcPICK_ERR_PROCESS_FAILED = -1066334203
} MpPickErrorEnum;

typedef enum MpPickRegCreateObjModeEnum
{	mpPICK_CREATE_SINGLEITEM,
	mpPICK_CREATE_CONTAINER_FULL,
	mpPICK_CREATE_CONTAINER_EMPTY,
	mpPICK_CREATE_CONTAINER_PLACEH,
	mpPICK_CREATE_SINGLEITEM_PLACEH
} MpPickRegCreateObjModeEnum;

typedef enum MpPickRegDeleteObjModeEnum
{	mpPICK_DEL_ALL,
	mpPICK_DEL_ALL_OBJECTS_OF_TYPE,
	mpPICK_DEL_ALL_PLACEH_OF_TYPE,
	mpPICK_DEL_ALL_SINGLEITEMS,
	mpPICK_DEL_ALL_SINGLEITEM_PLACEH,
	mpPICK_DEL_ALL_CONTAINERS,
	mpPICK_DEL_ALL_CONTAINER_PLACEH,
	mpPICK_DEL_ALL_OBJECTS,
	mpPICK_DEL_ALL_PLACEHOLDERS,
	mpPICK_DEL_ALL_FULL_CONTAINERS,
	mpPICK_DEL_ALL_EMPTY_CONTAINERS,
	mpPICK_DEL_CERTAIN_ITEM,
	mpPICK_DEL_CONTAINER_CONTENT
} MpPickRegDeleteObjModeEnum;

typedef enum MpPickRegGetObjModeEnum
{	mpPICK_GET_ALL,
	mpPICK_GET_ALL_OBJECTS_OF_TYPE,
	mpPICK_GET_ALL_PLACEH_OF_TYPE,
	mpPICK_GET_ALL_SINGLEITEMS,
	mpPICK_GET_ALL_SINGLEITEM_PLACEH,
	mpPICK_GET_ALL_CONTAINERS,
	mpPICK_GET_ALL_CONTAINER_PLACEH,
	mpPICK_GET_ALL_OBJECTS,
	mpPICK_GET_ALL_PLACEHOLDERS,
	mpPICK_GET_ALL_FULL_CONTAINERS,
	mpPICK_GET_ALL_EMPTY_CONTAINERS,
	mpPICK_GET_CERTAIN_ITEM,
	mpPICK_GET_CONTAINER_CONTENT
} MpPickRegGetObjModeEnum;

typedef enum MpPickRegisterComponentStateEnum
{	mcPICK_REGISTER_STARTUP,
	mcPICK_REGISTER_DISABLED,
	mcPICK_REGISTER_READY,
	mcPICK_REGISTER_ERRORSTOP,
	mcPICK_REGISTER_INVALID_CONFIG
} MpPickRegisterComponentStateEnum;

typedef enum MpPCGripEnum
{	mcPCG_STD = 0
} MpPCGripEnum;

typedef enum MpPCGripStdToolEnum
{	mcPCGST_AX_GRP = 0
} MpPCGripStdToolEnum;

typedef enum MpPCGripStdOpCloseEnum
{	mcPCGSOC_TIME_BASED = 0
} MpPCGripStdOpCloseEnum;

typedef enum MpPCJobMoveEnum
{	mcPCJM_BASIC = 0
} MpPCJobMoveEnum;

typedef enum MpPCJobLimEnum
{	mcPCJL_NOT_USE = 0,
	mcPCJL_BASIC = 1
} MpPCJobLimEnum;

typedef enum MpPCOMAJProcEnum
{	mcPCOMAJP_FIFO = 0,
	mcPCOMAJP_INFEED_OUTFEED = 1
} MpPCOMAJProcEnum;

typedef enum MpPCOMAJExeBxEnum
{	mcPCOMAJJEB_WAIT_PLH = 0,
	mcPCOMAJJEB_ALW_PICK = 1
} MpPCOMAJExeBxEnum;

typedef enum MpPCOMAJEBAPWaitBxEnum
{	mcPCOMAJEBAPWB_MOVE_FIX_POS = 0
} MpPCOMAJEBAPWaitBxEnum;

typedef enum MpPCOMAJEBAPWBMFPPosEnum
{	mcPCOMAJEBAPWBMFPP_STD = 0
} MpPCOMAJEBAPWBMFPPosEnum;

typedef enum MpPCOpModJobSchedEnum
{	mcPCOMJS_ALT = 0,
	mcPCOMJS_PRF_CHEAP = 1
} MpPCOpModJobSchedEnum;

typedef enum MpPCOpModIdleBxEnum
{	mcPCOMIB_FIX_WAIT_POS = 0
} MpPCOpModIdleBxEnum;

typedef enum MpPCOMIBSFWPEnum
{	mcPCOMIBSFWP_STD = 0
} MpPCOMIBSFWPEnum;

typedef enum MpPRTypEnum
{	mcPRT_STAT_POS = 0,
	mcPRT_LIN_CNVR = 1
} MpPRTypEnum;

typedef enum MpPRTLCMSEnum
{	mcPRTLCMS_POS_PROC_VAR = 0,
	mcPRTLCMS_AX = 1
} MpPRTLCMSEnum;

typedef enum MpPOLObjEnum
{	mcPOLO_SNG_ITEM = 0,
	mcPOLO_CNTR = 1
} MpPOLObjEnum;

typedef struct MpPickStatusIDType
{	enum MpPickErrorEnum ID;
	enum MpComSeveritiesEnum Severity;
	unsigned short Code;
} MpPickStatusIDType;

typedef struct MpPickDiagType
{	struct MpPickStatusIDType StatusID;
} MpPickDiagType;

typedef struct MpPickCoreInfoType
{	enum MpPickCoreComponentStateEnum ComponentState;
	struct MpPickDiagType Diag;
} MpPickCoreInfoType;

typedef struct MpPickCoreParType
{	plcstring OperationMode[81];
} MpPickCoreParType;

typedef struct MpInternalPickCoreIfType
{	plcdword vtable;
} MpInternalPickCoreIfType;

typedef struct MpPickCoreType
{	struct MpInternalPickCoreIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpPickCoreType;

typedef struct MpPickObjectListType
{
} MpPickObjectListType;

typedef struct MpPickObjLatchedConvType
{	double Position;
} MpPickObjLatchedConvType;

typedef unsigned long MpPickRegObjPosIdType;

typedef unsigned long MpPickObjectTypeIdentType;

typedef struct MpPickObjPosInfoType
{	MpPickRegObjPosIdType ObjectPositionId;
	struct McPosType Translation;
	struct McOrientType Orientation;
	MpPickObjectTypeIdentType ObjectTypeIdent;
	unsigned long ObjectAttachment;
	plcbit IsPlaceholder;
} MpPickObjPosInfoType;

typedef struct MpPickRegCreateObjectsParType
{	unsigned long DataAddress;
	unsigned short NumberOfObjects;
} MpPickRegCreateObjectsParType;

typedef struct MpPickRegCreateObjectParType
{	enum MpPickRegCreateObjModeEnum Mode;
	plcstring ObjectTypeName[251];
	struct MpPickObjLatchedConvType LatchedConveyor;
	struct McPosType Translation;
	struct McOrientType Orientation;
	unsigned long ObjectAttachment;
} MpPickRegCreateObjectParType;

typedef struct MpInternalPickRegisterIfType
{	plcdword vtable;
} MpInternalPickRegisterIfType;

typedef struct MpPickRegDeleteObjectsParType
{	enum MpPickRegDeleteObjModeEnum Mode;
	MpPickRegObjPosIdType ObjectPositionId;
	plcstring ObjectTypeName[251];
} MpPickRegDeleteObjectsParType;

typedef struct MpPickRegGetObjectsParType
{	enum MpPickRegGetObjModeEnum GetMode;
	MpPickRegObjPosIdType ObjectPositionId;
	plcstring ObjectTypeName[251];
	unsigned long CoordSystem;
	unsigned long DataAddress;
	unsigned short NumberOfObjectPositions;
} MpPickRegGetObjectsParType;

typedef struct MpPickRegisterInfoType
{	enum MpPickRegisterComponentStateEnum ComponentState;
	unsigned short NumberOfObjects;
	struct MpPickDiagType Diag;
} MpPickRegisterInfoType;

typedef struct MpPickRegisterType
{	struct MpInternalPickRegisterIfType* controlif;
	struct McInternalMappLinkType mappLinkInternal;
} MpPickRegisterType;

typedef struct MpPickRegSetObjectParType
{	MpPickRegObjPosIdType ObjectPositionId;
	unsigned long ObjectAttachment;
} MpPickRegSetObjectParType;

typedef struct MpPCGripStdToolType
{	enum MpPCGripStdToolEnum Type;
} MpPCGripStdToolType;

typedef struct MpPCGripStdOpCloseTimeBasedType
{	float CloseTime;
	float OpenTime;
	plcstring ProcessVariableName[251];
} MpPCGripStdOpCloseTimeBasedType;

typedef struct MpPCGripStdOpCloseType
{	enum MpPCGripStdOpCloseEnum Type;
	struct MpPCGripStdOpCloseTimeBasedType TimeBased;
} MpPCGripStdOpCloseType;

typedef struct MpPCGripStdType
{	struct MpPCGripStdToolType Tool;
	struct MpPCGripStdOpCloseType OpenClose;
} MpPCGripStdType;

typedef struct MpPCGripType
{	enum MpPCGripEnum Type;
	struct MpPCGripStdType Standard;
} MpPCGripType;

typedef struct MpPCJobMoveBasicType
{	double PickOffsetZ;
	double PlaceOffsetZ;
	double RoundingEdgeRadius;
} MpPCJobMoveBasicType;

typedef struct MpPCJobMoveType
{	enum MpPCJobMoveEnum Type;
	struct MpPCJobMoveBasicType Basic;
} MpPCJobMoveType;

typedef struct MpPCJobLimBasicLimType
{	double Velocity;
	double Acceleration;
	double Deceleration;
} MpPCJobLimBasicLimType;

typedef struct MpPCJobLimBasicType
{	struct MpPCJobLimBasicLimType WithObject;
	struct MpPCJobLimBasicLimType WithoutObject;
} MpPCJobLimBasicType;

typedef struct MpPCJobLimType
{	enum MpPCJobLimEnum Type;
	struct MpPCJobLimBasicType Basic;
} MpPCJobLimType;

typedef struct MpCfgPickJobType
{	plcstring Name[251];
	plcstring ObjectName[251];
	struct McCfgReferenceType InfeedRegisterReference;
	struct McCfgReferenceType OutfeedRegisterReference;
	struct MpPCJobMoveType Movement;
	struct MpPCJobLimType Limits;
} MpCfgPickJobType;

typedef struct MpPCOMAJProcInOutFeedPrfType
{	plcbit FirstRegistered;
	plcbit FirstLeavingWorkspace;
	plcbit ShortestProcessingTime;
	plcbit ShortestDistance;
} MpPCOMAJProcInOutFeedPrfType;

typedef struct MpPCOMAJProcInOutfeedType
{	struct MpPCOMAJProcInOutFeedPrfType InfeedPreferences;
	struct MpPCOMAJProcInOutFeedPrfType OutfeedPreferences;
} MpPCOMAJProcInOutfeedType;

typedef struct MpPCOMAJProcType
{	enum MpPCOMAJProcEnum Type;
	struct MpPCOMAJProcInOutfeedType InfeedOutfeed;
} MpPCOMAJProcType;

typedef struct MpPCOMAJEBAPWBMFPPosStdType
{	plcstring FrameName[251];
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} MpPCOMAJEBAPWBMFPPosStdType;

typedef struct MpPCOMAJEBAPWBMFPPosType
{	enum MpPCOMAJEBAPWBMFPPosEnum Type;
	struct MpPCOMAJEBAPWBMFPPosStdType Standard;
} MpPCOMAJEBAPWBMFPPosType;

typedef struct MpPCOMAJEBAPWaitBxMoveFixPosType
{	struct MpPCOMAJEBAPWBMFPPosType Position;
} MpPCOMAJEBAPWaitBxMoveFixPosType;

typedef struct MpPCOMAJEBAPWaitBxType
{	enum MpPCOMAJEBAPWaitBxEnum Type;
	struct MpPCOMAJEBAPWaitBxMoveFixPosType MovementFixedPosition;
} MpPCOMAJEBAPWaitBxType;

typedef struct MpPCOMAJExeBxAlwPickType
{	struct MpPCOMAJEBAPWaitBxType WaitingBehavior;
} MpPCOMAJExeBxAlwPickType;

typedef struct MpPCOMAJExeBxType
{	enum MpPCOMAJExeBxEnum Type;
	struct MpPCOMAJExeBxAlwPickType AlwaysPick;
} MpPCOMAJExeBxType;

typedef struct MpPCOpModAsgJobType
{	McCfgString250Type Name;
	unsigned short Priority;
	struct MpPCOMAJProcType Processing;
	struct MpPCOMAJExeBxType JobExecutionBehaviour;
} MpPCOpModAsgJobType;

typedef struct MpPCOpModJobSchedType
{	enum MpPCOpModJobSchedEnum Type;
} MpPCOpModJobSchedType;

typedef struct MpPCOMIBSFWPStdType
{	plcstring FrameName[251];
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} MpPCOMIBSFWPStdType;

typedef struct MpPCOMIBSFWPType
{	enum MpPCOMIBSFWPEnum Type;
	struct MpPCOMIBSFWPStdType Standard;
} MpPCOMIBSFWPType;

typedef struct MpPCOpModIdleBxFixWaitPosType
{	struct MpPCOMIBSFWPType Position;
} MpPCOpModIdleBxFixWaitPosType;

typedef struct MpPCOpModIdleBxType
{	enum MpPCOpModIdleBxEnum Type;
	struct MpPCOpModIdleBxFixWaitPosType FixedWaitingPosition;
} MpPCOpModIdleBxType;

typedef struct MpCfgPickOpModType
{	plcstring Name[251];
	struct MpPCOpModAsgJobType AssignedJob[10];
	struct MpPCOpModJobSchedType JobScheduling;
	struct MpPCOpModIdleBxType IdleBehavior;
} MpCfgPickOpModType;

typedef struct MpCfgPickCoreType
{	struct McCfgReferenceType AxesgroupReference;
	struct MpPCGripType Gripper;
	struct McCfgUnboundedArrayType Job;
	struct McCfgUnboundedArrayType OperationMode;
} MpCfgPickCoreType;

typedef struct MpPRTypStatPosType
{	plcstring FrameName[251];
} MpPRTypStatPosType;

typedef struct MpPRTLCMSPosProcVarMoveLimType
{	double VelocityLimit;
	double AccelerationLimit;
	double DecelerationLimit;
} MpPRTLCMSPosProcVarMoveLimType;

typedef struct MpPRTLCMSPosProcVarType
{	plcstring ProcessVariableName[251];
	double NegativeOverflow;
	double PositiveOverflow;
	struct MpPRTLCMSPosProcVarMoveLimType MovementLimits;
} MpPRTLCMSPosProcVarType;

typedef struct MpPRTLCMSAxType
{	struct McCfgReferenceType AxisReference;
} MpPRTLCMSAxType;

typedef struct MpPRTLCMSType
{	enum MpPRTLCMSEnum Type;
	struct MpPRTLCMSPosProcVarType PositionProcessVariable;
	struct MpPRTLCMSAxType Axis;
} MpPRTLCMSType;

typedef struct MpPRTypLinCnvrType
{	plcstring FrameName[251];
	double Length;
	double Width;
	double Height;
	unsigned long ObjectCount;
	struct MpPRTLCMSType MotionSource;
} MpPRTypLinCnvrType;

typedef struct MpPRTypType
{	enum MpPRTypEnum Type;
	struct MpPRTypStatPosType StaticPosition;
	struct MpPRTypLinCnvrType LinearConveyor;
} MpPRTypType;

typedef struct MpCfgPickRegType
{	struct MpPRTypType Type;
} MpCfgPickRegType;

typedef struct MpPOLObjSngItemType
{	plcstring Name[251];
} MpPOLObjSngItemType;

typedef struct MpPOLObjCntrLyrPosType
{	McCfgString250Type Object;
	struct McCfgTransXYZType Translation;
	struct McCfgOrientType Orientation;
} MpPOLObjCntrLyrPosType;

typedef struct MpPOLObjCntrLyrType
{	struct McCfgUnboundedArrayType Position;
} MpPOLObjCntrLyrType;

typedef struct MpPOLObjCntrType
{	plcstring Name[251];
	struct McCfgUnboundedArrayType Layer;
} MpPOLObjCntrType;

typedef struct MpPOLObjType
{	enum MpPOLObjEnum Type;
	struct MpPOLObjSngItemType SingleItem;
	struct MpPOLObjCntrType Container;
} MpPOLObjType;

typedef struct MpCfgPickObjLstType
{	struct McCfgUnboundedArrayType Object;
} MpCfgPickObjLstType;

typedef struct MpPickCore
{
	/* VAR_INPUT (analog) */
	struct MpPickCoreType* MpLink;
	struct MpPickCoreParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpPickCoreInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit ProcessEnable;
	plcbit ProcessStart;
	plcbit ProcessStop;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit ProcessActive;
	plcbit ProcessRunning;
} MpPickCore_typ;

typedef struct MpPickRegister
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct MpPickRegisterInfoType Info;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	plcbit RegisterEnable;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit RegisterActive;
} MpPickRegister_typ;

typedef struct MpPickRegCreateObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegCreateObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Create;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegCreateObjects_typ;

typedef struct MpPickRegCreateObject
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegCreateObjectParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	MpPickRegObjPosIdType ObjectPositionId;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Create;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegCreateObject_typ;

typedef struct MpPickRegDeleteObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegDeleteObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Delete;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegDeleteObjects_typ;

typedef struct MpPickRegGetObjects
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegGetObjectsParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned short ObjectPositionsFound;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Get;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegGetObjects_typ;

typedef struct MpPickRegSetObject
{
	/* VAR_INPUT (analog) */
	struct MpPickRegisterType* MpLink;
	struct MpPickRegSetObjectParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct MpComInternalDataType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Set;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
	plcbit CommandBusy;
	plcbit CommandDone;
} MpPickRegSetObject_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MpPickCore(struct MpPickCore* inst);
_BUR_PUBLIC void MpPickRegister(struct MpPickRegister* inst);
_BUR_PUBLIC void MpPickRegCreateObjects(struct MpPickRegCreateObjects* inst);
_BUR_PUBLIC void MpPickRegCreateObject(struct MpPickRegCreateObject* inst);
_BUR_PUBLIC void MpPickRegDeleteObjects(struct MpPickRegDeleteObjects* inst);
_BUR_PUBLIC void MpPickRegGetObjects(struct MpPickRegGetObjects* inst);
_BUR_PUBLIC void MpPickRegSetObject(struct MpPickRegSetObject* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MPPICK_ */

