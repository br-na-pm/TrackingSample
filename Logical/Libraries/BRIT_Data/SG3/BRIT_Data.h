/* Automation Studio generated header file */
/* Do not edit ! */
/* BRIT_Data 1.00.2 */

#ifndef _BRIT_DATA_
#define _BRIT_DATA_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _BRIT_Data_VERSION
#define _BRIT_Data_VERSION 1.00.2
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define BRIT_DATA_MAX_SAMPLES_IDX 49U
#else
 _GLOBAL_CONST unsigned long BRIT_DATA_MAX_SAMPLES_IDX;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct BRIT_DataParam_typ
{	unsigned short nr_samples;
} BRIT_DataParam_typ;

typedef struct BRIT_Data_Input_typ
{	signed long Data;
	signed long Time;
} BRIT_Data_Input_typ;

typedef struct BRIT_Data_IS_typ
{	unsigned long i;
	double buf_time[50];
	double buf_data[50];
	unsigned long nr_samples;
	struct BRIT_Data_Input_typ old_data;
	double avg_x;
	double avg_y;
	double cov_xy;
	double var_xx;
	double a;
	double b;
	plcbit oldEnable;
	unsigned short max_samples;
	double DataOut;
	double OutTime;
	unsigned short act_idx;
	unsigned short prev_idx;
} BRIT_Data_IS_typ;

typedef struct BRIT_DataPredict
{
	/* VAR_INPUT (analog) */
	struct BRIT_DataParam_typ Parameters;
	struct BRIT_Data_Input_typ DataIn;
	signed long OutTime;
	/* VAR_OUTPUT (analog) */
	signed long DataOut;
	/* VAR (analog) */
	struct BRIT_Data_IS_typ IS;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit ErrorReset;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Error;
	plcbit Valid;
} BRIT_DataPredict_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void BRIT_DataPredict(struct BRIT_DataPredict* inst);


#ifdef __cplusplus
};
#endif
#endif /* _BRIT_DATA_ */

