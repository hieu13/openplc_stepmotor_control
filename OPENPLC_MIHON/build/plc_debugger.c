/*
 * DEBUGGER code
 * 
 * On "publish", when buffer is free, debugger stores arbitrary variables 
 * content into, and mark this buffer as filled
 * 
 * 
 * Buffer content is read asynchronously, (from non real time part), 
 * and then buffer marked free again.
 *  
 * 
 * */
#ifdef TARGET_DEBUG_AND_RETAIN_DISABLE

void __init_debug    (void){}
void __cleanup_debug (void){}
void __retrieve_debug(void){}
void __publish_debug (void){}

#else

#include "iec_types_all.h"
#include "POUS.h"
/*for memcpy*/
#include <string.h>
#include <stdio.h>

typedef unsigned int dbgvardsc_index_t;
typedef unsigned short trace_buf_offset_t;

#define BUFFER_EMPTY 0
#define BUFFER_FULL 1

#ifndef TARGET_ONLINE_DEBUG_DISABLE

#define TRACE_BUFFER_SIZE 4096
#define TRACE_LIST_SIZE 1024

/* Atomically accessed variable for buffer state */
static long trace_buffer_state = BUFFER_EMPTY;

typedef struct trace_item_s {
    dbgvardsc_index_t dbgvardsc_index;
} trace_item_t;

trace_item_t trace_list[TRACE_LIST_SIZE];
char trace_buffer[TRACE_BUFFER_SIZE];

/* Trace's cursor*/
static trace_item_t *trace_list_collect_cursor = trace_list;
static trace_item_t *trace_list_addvar_cursor = trace_list;
static const trace_item_t *trace_list_end = 
    &trace_list[TRACE_LIST_SIZE-1];
static char *trace_buffer_cursor = trace_buffer;
static const char *trace_buffer_end = trace_buffer + TRACE_BUFFER_SIZE;



#define FORCE_BUFFER_SIZE 1024
#define FORCE_LIST_SIZE 256

typedef struct force_item_s {
    dbgvardsc_index_t dbgvardsc_index;
    void *value_pointer_backup;
} force_item_t;

force_item_t force_list[FORCE_LIST_SIZE];
char force_buffer[FORCE_BUFFER_SIZE];

/* Force's cursor*/
static force_item_t *force_list_apply_cursor = force_list;
static force_item_t *force_list_addvar_cursor = force_list;
static const force_item_t *force_list_end = 
    &force_list[FORCE_LIST_SIZE-1];
static char *force_buffer_cursor = force_buffer;
static const char *force_buffer_end = force_buffer + FORCE_BUFFER_SIZE;


#endif

/***
 * Declare programs 
 **/
extern PLC_STEP_PULSE_CTR RES0__INSTANCE0;
extern MAIN RES0__INSTANCE1;

/***
 * Declare global variables from resources and conf 
 **/
extern __IEC_BOOL_t CONFIG0__ZERO_M1_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M2_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M3_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M4_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M5_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M6_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M7_KAKI_OK;
extern __IEC_BOOL_t CONFIG0__ZERO_M8_KAKI_OK;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR1_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR2_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR3_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR4_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR5_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR6_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR7_1;
extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR8_1;
extern __IEC_BOOL_t CONFIG0__CW_M1;
extern __IEC_BOOL_t CONFIG0__CW_M2;
extern __IEC_BOOL_t CONFIG0__CW_M3;
extern __IEC_BOOL_t CONFIG0__CW_M4;
extern __IEC_BOOL_t CONFIG0__CW_M5;
extern __IEC_BOOL_t CONFIG0__CW_M6;
extern __IEC_BOOL_t CONFIG0__CW_M7;
extern __IEC_BOOL_t CONFIG0__CW_M8;
extern __IEC_BOOL_t CONFIG0__CCW_M1;
extern __IEC_BOOL_t CONFIG0__CCW_M2;
extern __IEC_BOOL_t CONFIG0__CCW_M3;
extern __IEC_BOOL_t CONFIG0__CCW_M4;
extern __IEC_BOOL_t CONFIG0__CCW_M5;
extern __IEC_BOOL_t CONFIG0__CCW_M6;
extern __IEC_BOOL_t CONFIG0__CCW_M7;
extern __IEC_BOOL_t CONFIG0__CCW_M8;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO1;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO2;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO3;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO4;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO5;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO6;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO7;
extern __IEC_BYTE_t CONFIG0__DATA_MOTO8;
extern __IEC_DWORD_t CONFIG0__CURRENT_M1_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M2_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M3_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M4_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M5_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M6_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M7_POS;
extern __IEC_DWORD_t CONFIG0__CURRENT_M8_POS;
extern __IEC_UINT_t CONFIG0__MOTOR1_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR2_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR3_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR4_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR5_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR6_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR7_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR8_SPEED;
extern __IEC_UINT_t CONFIG0__MOTOR1_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR2_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR3_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR4_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR5_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR6_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR7_ACCEL;
extern __IEC_UINT_t CONFIG0__MOTOR8_ACCEL;
extern __IEC_BOOL_t CONFIG0__START_MOTO_1;
extern __IEC_BOOL_t CONFIG0__START_MOTO_2;
extern __IEC_BOOL_t CONFIG0__START_MOTO_3;
extern __IEC_BOOL_t CONFIG0__START_MOTO_4;
extern __IEC_BOOL_t CONFIG0__START_MOTO_5;
extern __IEC_BOOL_t CONFIG0__START_MOTO_6;
extern __IEC_BOOL_t CONFIG0__START_MOTO_7;
extern __IEC_BOOL_t CONFIG0__START_MOTO_8;
extern __IEC_BOOL_t CONFIG0__MOTOR1_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR2_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR3_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR4_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR5_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR6_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR7_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR8_RUNNING;
extern __IEC_BOOL_t CONFIG0__MOTOR1_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR2_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR3_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR4_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR5_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR6_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR7_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__MOTOR8_POSITION_OK;
extern __IEC_BOOL_t CONFIG0__LR_0;
extern __IEC_BOOL_t CONFIG0__LR_1;
extern __IEC_BOOL_t CONFIG0__LR_2;
extern __IEC_BOOL_t CONFIG0__LR_3;
extern __IEC_BOOL_t CONFIG0__LR_4;
extern __IEC_BOOL_t CONFIG0__LR_5;
extern __IEC_BOOL_t CONFIG0__LR_6;
extern __IEC_BOOL_t CONFIG0__LR_7;
extern __IEC_BOOL_t CONFIG0__LR_8;
extern __IEC_BOOL_t CONFIG0__LR_9;
extern __IEC_BOOL_t CONFIG0__LR_10;
extern __IEC_BOOL_t CONFIG0__LR_11;
extern __IEC_BOOL_t CONFIG0__LR_12;
extern __IEC_BOOL_t CONFIG0__LR_13;
extern __IEC_BOOL_t CONFIG0__LR_14;
extern __IEC_BOOL_t CONFIG0__LR_15;
extern __IEC_DWORD_t CONFIG0__DM_0;
extern __IEC_DWORD_t CONFIG0__DM_1;
extern __IEC_DWORD_t CONFIG0__DM_2;
extern __IEC_DWORD_t CONFIG0__DM_3;
extern __IEC_DWORD_t CONFIG0__DM_4;
extern __IEC_DWORD_t CONFIG0__DM_5;
extern __IEC_DWORD_t CONFIG0__DM_6;
extern __IEC_DWORD_t CONFIG0__DM_7;
extern __IEC_DWORD_t CONFIG0__DM_8;
extern __IEC_DWORD_t CONFIG0__DM_9;
extern __IEC_DWORD_t CONFIG0__DM_10;
extern __IEC_DWORD_t CONFIG0__DM_11;
extern __IEC_DWORD_t CONFIG0__DM_12;
extern __IEC_DWORD_t CONFIG0__DM_13;
extern __IEC_DWORD_t CONFIG0__DM_14;
extern __IEC_DWORD_t CONFIG0__DM_15;
extern __IEC_DWORD_t CONFIG0__DM_16;
extern __IEC_DWORD_t CONFIG0__DM_17;
extern __IEC_DWORD_t CONFIG0__DM_18;
extern __IEC_DWORD_t CONFIG0__DM_19;
extern __IEC_UINT_t CONFIG0__COIL_256;
extern       PLC_STEP_PULSE_CTR   RES0__INSTANCE0;
extern       MAIN   RES0__INSTANCE1;

typedef const struct {
    void *ptr;
    __IEC_types_enum type;
} dbgvardsc_t;

static const dbgvardsc_t dbgvardsc[] = {
{&(CONFIG0__ZERO_M1_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M2_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M3_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M4_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M5_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M6_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M7_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__ZERO_M8_KAKI_OK), BOOL_ENUM},
{&(CONFIG0__POSITION_MOTOR1_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR2_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR3_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR4_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR5_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR6_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR7_1), DWORD_ENUM},
{&(CONFIG0__POSITION_MOTOR8_1), DWORD_ENUM},
{&(CONFIG0__CW_M1), BOOL_ENUM},
{&(CONFIG0__CW_M2), BOOL_ENUM},
{&(CONFIG0__CW_M3), BOOL_ENUM},
{&(CONFIG0__CW_M4), BOOL_ENUM},
{&(CONFIG0__CW_M5), BOOL_ENUM},
{&(CONFIG0__CW_M6), BOOL_ENUM},
{&(CONFIG0__CW_M7), BOOL_ENUM},
{&(CONFIG0__CW_M8), BOOL_ENUM},
{&(CONFIG0__CCW_M1), BOOL_ENUM},
{&(CONFIG0__CCW_M2), BOOL_ENUM},
{&(CONFIG0__CCW_M3), BOOL_ENUM},
{&(CONFIG0__CCW_M4), BOOL_ENUM},
{&(CONFIG0__CCW_M5), BOOL_ENUM},
{&(CONFIG0__CCW_M6), BOOL_ENUM},
{&(CONFIG0__CCW_M7), BOOL_ENUM},
{&(CONFIG0__CCW_M8), BOOL_ENUM},
{&(CONFIG0__DATA_MOTO1), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO2), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO3), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO4), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO5), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO6), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO7), BYTE_ENUM},
{&(CONFIG0__DATA_MOTO8), BYTE_ENUM},
{&(CONFIG0__CURRENT_M1_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M2_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M3_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M4_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M5_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M6_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M7_POS), DWORD_ENUM},
{&(CONFIG0__CURRENT_M8_POS), DWORD_ENUM},
{&(CONFIG0__MOTOR1_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR2_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR3_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR4_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR5_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR6_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR7_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR8_SPEED), UINT_ENUM},
{&(CONFIG0__MOTOR1_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR2_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR3_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR4_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR5_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR6_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR7_ACCEL), UINT_ENUM},
{&(CONFIG0__MOTOR8_ACCEL), UINT_ENUM},
{&(CONFIG0__START_MOTO_1), BOOL_ENUM},
{&(CONFIG0__START_MOTO_2), BOOL_ENUM},
{&(CONFIG0__START_MOTO_3), BOOL_ENUM},
{&(CONFIG0__START_MOTO_4), BOOL_ENUM},
{&(CONFIG0__START_MOTO_5), BOOL_ENUM},
{&(CONFIG0__START_MOTO_6), BOOL_ENUM},
{&(CONFIG0__START_MOTO_7), BOOL_ENUM},
{&(CONFIG0__START_MOTO_8), BOOL_ENUM},
{&(CONFIG0__MOTOR1_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR2_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR3_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR4_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR5_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR6_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR7_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR8_RUNNING), BOOL_ENUM},
{&(CONFIG0__MOTOR1_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR2_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR3_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR4_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR5_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR6_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR7_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__MOTOR8_POSITION_OK), BOOL_ENUM},
{&(CONFIG0__LR_0), BOOL_ENUM},
{&(CONFIG0__LR_1), BOOL_ENUM},
{&(CONFIG0__LR_2), BOOL_ENUM},
{&(CONFIG0__LR_3), BOOL_ENUM},
{&(CONFIG0__LR_4), BOOL_ENUM},
{&(CONFIG0__LR_5), BOOL_ENUM},
{&(CONFIG0__LR_6), BOOL_ENUM},
{&(CONFIG0__LR_7), BOOL_ENUM},
{&(CONFIG0__LR_8), BOOL_ENUM},
{&(CONFIG0__LR_9), BOOL_ENUM},
{&(CONFIG0__LR_10), BOOL_ENUM},
{&(CONFIG0__LR_11), BOOL_ENUM},
{&(CONFIG0__LR_12), BOOL_ENUM},
{&(CONFIG0__LR_13), BOOL_ENUM},
{&(CONFIG0__LR_14), BOOL_ENUM},
{&(CONFIG0__LR_15), BOOL_ENUM},
{&(CONFIG0__DM_0), DWORD_ENUM},
{&(CONFIG0__DM_1), DWORD_ENUM},
{&(CONFIG0__DM_2), DWORD_ENUM},
{&(CONFIG0__DM_3), DWORD_ENUM},
{&(CONFIG0__DM_4), DWORD_ENUM},
{&(CONFIG0__DM_5), DWORD_ENUM},
{&(CONFIG0__DM_6), DWORD_ENUM},
{&(CONFIG0__DM_7), DWORD_ENUM},
{&(CONFIG0__DM_8), DWORD_ENUM},
{&(CONFIG0__DM_9), DWORD_ENUM},
{&(CONFIG0__DM_10), DWORD_ENUM},
{&(CONFIG0__DM_11), DWORD_ENUM},
{&(CONFIG0__DM_12), DWORD_ENUM},
{&(CONFIG0__DM_13), DWORD_ENUM},
{&(CONFIG0__DM_14), DWORD_ENUM},
{&(CONFIG0__DM_15), DWORD_ENUM},
{&(CONFIG0__DM_16), DWORD_ENUM},
{&(CONFIG0__DM_17), DWORD_ENUM},
{&(CONFIG0__DM_18), DWORD_ENUM},
{&(CONFIG0__DM_19), DWORD_ENUM},
{&(CONFIG0__COIL_256), UINT_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR1_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR2_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR3_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR4_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR5_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR6_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR7_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.POSITION_MOTOR8_1), DWORD_P_ENUM},
{&(RES0__INSTANCE0.STEP_1), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_2), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_3), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_4), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_5), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_6), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_7), DWORD_ENUM},
{&(RES0__INSTANCE0.STEP_8), DWORD_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR1), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR2), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR3), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR4), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR5), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR6), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR7), BOOL_ENUM},
{&(RES0__INSTANCE0.EN_MOTOR8), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M1), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M2), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M3), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M4), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M5), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M6), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M7), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CW_M8), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M1), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M2), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M3), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M4), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M5), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M6), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M7), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M8), BOOL_P_ENUM},
{&(RES0__INSTANCE0.CCW_M1_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M2_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M3_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M4_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M5_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M6_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M7_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CCW_M8_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M1_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M2_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M3_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M4_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M5_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M6_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M7_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.CW_M8_ON), BOOL_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO1), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO2), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO3), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO4), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO5), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO6), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO7), BYTE_P_ENUM},
{&(RES0__INSTANCE0.DATA_MOTO8), BYTE_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M1_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M2_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M3_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M4_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M5_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M6_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M7_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_M8_POS), DWORD_P_ENUM},
{&(RES0__INSTANCE0.CURRENT_1_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_2_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_3_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_4_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_5_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_6_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_7_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.CURRENT_8_VITRI), DWORD_ENUM},
{&(RES0__INSTANCE0.MOTOR1_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR2_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR3_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR4_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR5_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR6_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR7_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR8_SPEED), UINT_P_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR1_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR2_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR3_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR4_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR5_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR6_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR7_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR8_SPEED), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR1_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR2_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR3_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR4_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR5_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR6_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR7_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.SET_MOTOR8_ACCEL), UINT_ENUM},
{&(RES0__INSTANCE0.MOTOR1_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR2_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR3_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR4_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR5_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR6_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR7_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MOTOR8_ACCEL), UINT_P_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M1), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M2), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M3), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M4), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M5), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M6), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M7), BYTE_ENUM},
{&(RES0__INSTANCE0.MODE_RUN_M8), BYTE_ENUM},
{&(RES0__INSTANCE0.START_MOTO_1), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_2), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_3), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_4), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_5), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_6), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_7), BOOL_P_ENUM},
{&(RES0__INSTANCE0.START_MOTO_8), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR1_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR2_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR3_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR4_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR5_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR6_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR7_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR8_RUNNING), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR1_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR2_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR3_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR4_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR5_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR6_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR7_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR8_POSITION_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.MOTOR1_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR2_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR3_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR4_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR5_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR6_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR7_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR8_RUNING), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR1_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR2_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR3_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR4_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR5_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR6_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR7_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.MOTOR8_POS_OK), BOOL_ENUM},
{&(RES0__INSTANCE0.ZERO_M1_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M2_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M3_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M4_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M5_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M6_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M7_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0.ZERO_M8_KAKI_OK), BOOL_P_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE15_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE15_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE12_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE12_OUT), BYTE_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE16_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE16_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE14_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE14_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE21_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE21_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE10_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE10_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE25_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE25_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE24_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE24_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE13_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE13_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE34_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE34_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE30_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE30_OUT), BYTE_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE36_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE36_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE38_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE38_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE40_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE40_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE57_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE57_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE56_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE56_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE66_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE66_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE63_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE63_OUT), BYTE_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE68_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE68_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE70_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE70_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE72_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE72_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE81_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE81_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE80_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE80_OUT), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE90_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE90_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE87_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE87_OUT), BYTE_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE92_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE92_OUT), DWORD_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE94_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE94_OUT), UINT_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE96_ENO), BOOL_ENUM},
{&(RES0__INSTANCE0._TMP_MOVE96_OUT), UINT_ENUM},
{&(RES0__INSTANCE1.TOF0.EN), BOOL_ENUM},
{&(RES0__INSTANCE1.TOF0.ENO), BOOL_ENUM},
{&(RES0__INSTANCE1.TOF0.IN), BOOL_ENUM},
{&(RES0__INSTANCE1.TOF0.PT), TIME_ENUM},
{&(RES0__INSTANCE1.TOF0.Q), BOOL_ENUM},
{&(RES0__INSTANCE1.TOF0.ET), TIME_ENUM},
{&(RES0__INSTANCE1.TOF0.STATE), SINT_ENUM},
{&(RES0__INSTANCE1.TOF0.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE1.TOF0.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE1.TOF0.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE1.TON0.EN), BOOL_ENUM},
{&(RES0__INSTANCE1.TON0.ENO), BOOL_ENUM},
{&(RES0__INSTANCE1.TON0.IN), BOOL_ENUM},
{&(RES0__INSTANCE1.TON0.PT), TIME_ENUM},
{&(RES0__INSTANCE1.TON0.Q), BOOL_ENUM},
{&(RES0__INSTANCE1.TON0.ET), TIME_ENUM},
{&(RES0__INSTANCE1.TON0.STATE), SINT_ENUM},
{&(RES0__INSTANCE1.TON0.PREV_IN), BOOL_ENUM},
{&(RES0__INSTANCE1.TON0.CURRENT_TIME), TIME_ENUM},
{&(RES0__INSTANCE1.TON0.START_TIME), TIME_ENUM},
{&(RES0__INSTANCE1.BLINK_LED0), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED1), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED2), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED3), BOOL_ENUM},
{&(RES0__INSTANCE1.BLINK_LED4), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED5), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED6), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED7), BOOL_O_ENUM},
{&(RES0__INSTANCE1.ANALOG_A0), INT_P_ENUM},
{&(RES0__INSTANCE1.ANALOG_A1), INT_P_ENUM},
{&(RES0__INSTANCE1.ANALOG_A2), INT_P_ENUM},
{&(RES0__INSTANCE1.ANALOG_A3), INT_P_ENUM},
{&(RES0__INSTANCE1.ANALOG_A0_VALUE), INT_ENUM},
{&(RES0__INSTANCE1.ANALOG_A1_VALUE), INT_ENUM},
{&(RES0__INSTANCE1.ANALOG_A2_VALUE), INT_ENUM},
{&(RES0__INSTANCE1.ANALOG_A3_VALUE), INT_ENUM},
{&(RES0__INSTANCE1.BUTTON0), BOOL_P_ENUM},
{&(RES0__INSTANCE1.BUTTON1), BOOL_P_ENUM},
{&(RES0__INSTANCE1.BUTTON2), BOOL_P_ENUM},
{&(RES0__INSTANCE1.BUTTON3), BOOL_P_ENUM},
{&(RES0__INSTANCE1.BUTTON_TEM0), BOOL_ENUM},
{&(RES0__INSTANCE1.BUTTON_TEM1), BOOL_ENUM},
{&(RES0__INSTANCE1.BUTTON_TEM2), BOOL_ENUM},
{&(RES0__INSTANCE1.BUTTON_TEM3), BOOL_ENUM},
{&(RES0__INSTANCE1.BLINK_LED8), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED9), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED10), BOOL_O_ENUM},
{&(RES0__INSTANCE1.BLINK_LED11), BOOL_O_ENUM},
{&(RES0__INSTANCE1.TEMP_COIL), BOOL_ENUM},
{&(RES0__INSTANCE1.TEMP_COIL0), BOOL_ENUM},
{&(RES0__INSTANCE1.TEMP_BT), BOOL_ENUM},
{&(RES0__INSTANCE1.TEMP_BT0), BOOL_ENUM},
{&(RES0__INSTANCE1.LR_0), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_1), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_2), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_3), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_4), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_5), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_6), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_7), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_8), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_9), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_10), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_11), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_12), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_13), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_14), BOOL_P_ENUM},
{&(RES0__INSTANCE1.LR_15), BOOL_P_ENUM},
{&(RES0__INSTANCE1.DM_0), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_1), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_2), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_3), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_4), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_5), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_6), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_7), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_8), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_9), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_10), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_11), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_12), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_13), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_14), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_15), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_16), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_17), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_18), DWORD_P_ENUM},
{&(RES0__INSTANCE1.DM_19), DWORD_P_ENUM},
{&(RES0__INSTANCE1.TEMP_1), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_2), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_3), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_4), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_5), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_6), DWORD_ENUM},
{&(RES0__INSTANCE1.TEMP_7), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST), BOOL_ENUM},
{&(RES0__INSTANCE1.TEST0), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST1), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST2), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST3), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST4), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST5), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST6), DWORD_ENUM},
{&(RES0__INSTANCE1.TEST7), DWORD_ENUM},
{&(RES0__INSTANCE1.COIL_LR), BOOL_ENUM},
{&(RES0__INSTANCE1.COIL_LR0), BOOL_ENUM},
{&(RES0__INSTANCE1.COIL_LR1), BOOL_ENUM},
{&(RES0__INSTANCE1.COIL_LR2), BOOL_ENUM},
{&(RES0__INSTANCE1.COIL_LR3), BOOL_ENUM},
{&(RES0__INSTANCE1.COIL_256), UINT_P_ENUM},
{&(RES0__INSTANCE1.COIL_257), UINT_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE15_OUT), INT_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE2_OUT), INT_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE14_OUT), INT_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE19_OUT), INT_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE57_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE60_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE63_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE66_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE68_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE68_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE74_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE74_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE75_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE75_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE78_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE78_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE81_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE81_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE86_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE86_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE89_ENO), BOOL_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE89_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE93_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE96_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE99_OUT), DWORD_ENUM},
{&(RES0__INSTANCE1._TMP_MOVE108_OUT), UINT_ENUM}
};

static const dbgvardsc_index_t retain_list[] = {

};
static unsigned int retain_list_collect_cursor = 0;
static const unsigned int retain_list_size = sizeof(retain_list)/sizeof(dbgvardsc_index_t);

typedef void(*__for_each_variable_do_fp)(dbgvardsc_t*);
void __for_each_variable_do(__for_each_variable_do_fp fp)
{
    unsigned int i;
    for(i = 0; i < sizeof(dbgvardsc)/sizeof(dbgvardsc_t); i++){
        dbgvardsc_t *dsc = &dbgvardsc[i];
        if(dsc->type != UNKNOWN_ENUM) 
            (*fp)(dsc);
    }
}

#define __Unpack_desc_type dbgvardsc_t


#define __Unpack_case_t(TYPENAME)                                           \
        case TYPENAME##_ENUM :                                              \
            if(flags) *flags = ((__IEC_##TYPENAME##_t *)varp)->flags;       \
            if(value_p) *value_p = &((__IEC_##TYPENAME##_t *)varp)->value;  \
		    if(size) *size = sizeof(TYPENAME);                              \
            break;

#define __Unpack_case_p(TYPENAME)                                           \
        case TYPENAME##_O_ENUM :                                            \
        case TYPENAME##_P_ENUM :                                            \
            if(flags) *flags = ((__IEC_##TYPENAME##_p *)varp)->flags;       \
            if(value_p) *value_p = ((__IEC_##TYPENAME##_p *)varp)->value;   \
		    if(size) *size = sizeof(TYPENAME);                              \
            break;

#define __Is_a_string(dsc) (dsc->type == STRING_ENUM)   ||\
                           (dsc->type == STRING_P_ENUM) ||\
                           (dsc->type == STRING_O_ENUM)

static int UnpackVar(__Unpack_desc_type *dsc, void **value_p, char *flags, size_t *size)
{
    void *varp = dsc->ptr;
    /* find data to copy*/
    switch(dsc->type){
        __ANY(__Unpack_case_t)
        __ANY(__Unpack_case_p)
    default:
        return 0; /* should never happen */
    }
    return 1;
}



void Remind(unsigned int offset, unsigned int count, void * p);

extern int CheckRetainBuffer(void);
extern void InitRetain(void);

void __init_debug(void)
{
    /* init local static vars */
#ifndef TARGET_ONLINE_DEBUG_DISABLE
    trace_buffer_cursor = trace_buffer;
    trace_list_addvar_cursor = trace_list;
    trace_list_collect_cursor = trace_list;
    trace_buffer_state = BUFFER_EMPTY;

    force_buffer_cursor = force_buffer;
    force_list_addvar_cursor = force_list;
    force_list_apply_cursor = force_list;
#endif

    InitRetain();
    /* Iterate over all variables to fill debug buffer */
    if(CheckRetainBuffer()){
        unsigned int retain_offset = 0;
        retain_list_collect_cursor = 0;

        /* iterate over retain list */
        while(retain_list_collect_cursor < retain_list_size){
            void *value_p = NULL;
            size_t size;
            char* next_cursor;

            dbgvardsc_t *dsc = &dbgvardsc[
                retain_list[retain_list_collect_cursor]];

            UnpackVar(dsc, &value_p, NULL, &size);

            /* if buffer not full */
            Remind(retain_offset, size, value_p);
            /* increment cursor according size*/
            retain_offset += size;

            retain_list_collect_cursor++;
        }
    }else{
        char mstr[] = "RETAIN memory invalid - defaults used";
        LogMessage(LOG_WARNING, mstr, sizeof(mstr));
    }
}

extern void InitiateDebugTransfer(void);
extern void CleanupRetain(void);

extern unsigned long __tick;

void __cleanup_debug(void)
{
#ifndef TARGET_ONLINE_DEBUG_DISABLE
    trace_buffer_cursor = trace_buffer;
    InitiateDebugTransfer();
#endif    

    CleanupRetain();
}

void __retrieve_debug(void)
{
}

void Retain(unsigned int offset, unsigned int count, void * p);

/* Return size of all retain variables */
unsigned int GetRetainSize(void)
{
    unsigned int retain_size = 0;
    retain_list_collect_cursor = 0;

    /* iterate over retain list */
    while(retain_list_collect_cursor < retain_list_size){
        void *value_p = NULL;
        size_t size;
        char* next_cursor;

        dbgvardsc_t *dsc = &dbgvardsc[
            retain_list[retain_list_collect_cursor]];

        UnpackVar(dsc, &value_p, NULL, &size);

        retain_size += size;
        retain_list_collect_cursor++;
    }

    return retain_size;
}


extern void PLC_GetTime(IEC_TIME*);
extern int TryEnterDebugSection(void);
extern long AtomicCompareExchange(long*, long, long);
extern long long AtomicCompareExchange64(long long* , long long , long long);
extern void LeaveDebugSection(void);
extern void ValidateRetainBuffer(void);
extern void InValidateRetainBuffer(void);

#define __ReForceOutput_case_p(TYPENAME)                                                            \
        case TYPENAME##_P_ENUM :                                                                    \
        case TYPENAME##_O_ENUM :                                                                    \
            {                                                                                       \
                char *next_cursor = force_buffer_cursor + sizeof(TYPENAME);                         \
                if(next_cursor <= force_buffer_end ){                                               \
                    /* outputs real value must be systematically forced */                          \
                    if(vartype == TYPENAME##_O_ENUM)                                                \
                        /* overwrite value pointed by backup */                                     \
                        *((TYPENAME *)force_list_apply_cursor->value_pointer_backup) =  \
                            *((TYPENAME *)force_buffer_cursor);                                     \
                    /* inc force_buffer cursor */                                                   \
                    force_buffer_cursor = next_cursor;                                              \
                }else{                                                                              \
                    stop = 1;                                                                       \
                }                                                                                   \
            }                                                                                       \
            break;
void __publish_debug(void)
{
    InValidateRetainBuffer();
    
#ifndef TARGET_ONLINE_DEBUG_DISABLE 
    /* Check there is no running debugger re-configuration */
    if(TryEnterDebugSection()){
        /* Lock buffer */
        long latest_state = AtomicCompareExchange(
            &trace_buffer_state,
            BUFFER_EMPTY,
            BUFFER_FULL);
            
        /* If buffer was free */
        if(latest_state == BUFFER_EMPTY)
        {
            int stop = 0;
            /* Reset force list cursor */
            force_list_apply_cursor = force_list;

            /* iterate over force list */
            while(!stop && force_list_apply_cursor < force_list_addvar_cursor){
                dbgvardsc_t *dsc = &dbgvardsc[
                    force_list_apply_cursor->dbgvardsc_index];
                void *varp = dsc->ptr;
                __IEC_types_enum vartype = dsc->type;
                switch(vartype){
                    __ANY(__ReForceOutput_case_p)
                default:
                    break;
                }
                force_list_apply_cursor++;
            }

            /* Reset buffer cursor */
            trace_buffer_cursor = trace_buffer;
            /* Reset trace list cursor */
            trace_list_collect_cursor = trace_list;

            /* iterate over trace list */
            while(trace_list_collect_cursor < trace_list_addvar_cursor){
                void *value_p = NULL;
                size_t size;
                char* next_cursor;

                dbgvardsc_t *dsc = &dbgvardsc[
                    trace_list_collect_cursor->dbgvardsc_index];

                UnpackVar(dsc, &value_p, NULL, &size);

                /* copy visible variable to buffer */;
                if(__Is_a_string(dsc)){
                    /* optimization for strings */
                    /* assume NULL terminated strings */
                    size = ((STRING*)value_p)->len + 1;
                }

                /* compute next cursor positon.*/
                next_cursor = trace_buffer_cursor + size;
                /* check for buffer overflow */
                if(next_cursor < trace_buffer_end)
                    /* copy data to the buffer */
                    memcpy(trace_buffer_cursor, value_p, size);
                else
                    /* stop looping in case of overflow */
                    break;
                /* increment cursor according size*/
                trace_buffer_cursor = next_cursor;
                trace_list_collect_cursor++;
            }
            
            /* Leave debug section,
             * Trigger asynchronous transmission 
             * (returns immediately) */
            InitiateDebugTransfer(); /* size */
        }
        LeaveDebugSection();
    }
#endif
    unsigned int retain_offset = 0;
    /* when not debugging, do only retain */
    retain_list_collect_cursor = 0;

    /* iterate over retain list */
    while(retain_list_collect_cursor < retain_list_size){
        void *value_p = NULL;
        size_t size;
        char* next_cursor;

        dbgvardsc_t *dsc = &dbgvardsc[
            retain_list[retain_list_collect_cursor]];

        UnpackVar(dsc, &value_p, NULL, &size);

        /* if buffer not full */
        Retain(retain_offset, size, value_p);
        /* increment cursor according size*/
        retain_offset += size;

        retain_list_collect_cursor++;
    }
    ValidateRetainBuffer();
}

#ifndef TARGET_ONLINE_DEBUG_DISABLE

#define TRACE_LIST_OVERFLOW    1
#define FORCE_LIST_OVERFLOW    2
#define FORCE_BUFFER_OVERFLOW  3

#define __ForceVariable_case_t(TYPENAME)                                                \
        case TYPENAME##_ENUM :                                                          \
            /* add to force_list*/                                                      \
            force_list_addvar_cursor->dbgvardsc_index = idx;                            \
            ((__IEC_##TYPENAME##_t *)varp)->flags |= __IEC_FORCE_FLAG;                  \
            ((__IEC_##TYPENAME##_t *)varp)->value = *((TYPENAME *)force);               \
            break;
#define __ForceVariable_case_p(TYPENAME)                                                \
        case TYPENAME##_P_ENUM :                                                        \
        case TYPENAME##_O_ENUM :                                                        \
            {                                                                           \
                char *next_cursor = force_buffer_cursor + sizeof(TYPENAME);             \
                if(next_cursor <= force_buffer_end ){                                   \
                    /* add to force_list*/                                              \
                    force_list_addvar_cursor->dbgvardsc_index = idx;                    \
                    /* save pointer to backup */                                        \
                    force_list_addvar_cursor->value_pointer_backup =                    \
                        ((__IEC_##TYPENAME##_p *)varp)->value;                          \
                    /* store forced value in force_buffer */                            \
                    *((TYPENAME *)force_buffer_cursor) = *((TYPENAME *)force);          \
                    /* replace pointer with pointer to force_buffer */                  \
                    ((__IEC_##TYPENAME##_p *)varp)->value =                             \
                        (TYPENAME *)force_buffer_cursor;                                \
                    (((__IEC_##TYPENAME##_p *)varp)->fvalue) = *((TYPENAME *)force);    \
                    /* mark variable as forced */                                       \
                    ((__IEC_##TYPENAME##_p *)varp)->flags |= __IEC_FORCE_FLAG;          \
                    /* inc force_buffer cursor */                                       \
                    force_buffer_cursor = next_cursor;                                  \
                    /* outputs real value must be systematically forced */              \
                    if(vartype == TYPENAME##_O_ENUM)                                    \
                        *(((__IEC_##TYPENAME##_p *)varp)->value) = *((TYPENAME *)force);\
                } else {                                                                \
                    error_code = FORCE_BUFFER_OVERFLOW;                                 \
                    goto error_cleanup;                                                 \
                }                                                                       \
            }                                                                           \
            break;


void ResetDebugVariables(void);

int RegisterDebugVariable(dbgvardsc_index_t idx, void* force)
{
    int error_code = 0;
    if(idx < sizeof(dbgvardsc)/sizeof(dbgvardsc_t)){
        /* add to trace_list, inc trace_list_addvar_cursor*/
        if(trace_list_addvar_cursor <= trace_list_end){
            trace_list_addvar_cursor->dbgvardsc_index = idx;
            trace_list_addvar_cursor++;
        } else {
            error_code = TRACE_LIST_OVERFLOW;
            goto error_cleanup;
        }
        if(force){
            if(force_list_addvar_cursor <= force_list_end){
                dbgvardsc_t *dsc = &dbgvardsc[idx];
                void *varp = dsc->ptr;
                __IEC_types_enum vartype = dsc->type;

                switch(vartype){
                    __ANY(__ForceVariable_case_t)
                    __ANY(__ForceVariable_case_p)
                default:
                    break;
                }
                /* inc force_list cursor */
                force_list_addvar_cursor++;
            } else {
                error_code = FORCE_LIST_OVERFLOW;
                goto error_cleanup;
            }
        }
    }
    return 0;

error_cleanup:
    ResetDebugVariables();
    trace_buffer_state = BUFFER_EMPTY;
    return error_code;
    
}

#define ResetForcedVariable_case_t(TYPENAME)                                            \
        case TYPENAME##_ENUM :                                                          \
            ((__IEC_##TYPENAME##_t *)varp)->flags &= ~__IEC_FORCE_FLAG;                 \
            /* for local variable we don't restore original value */                    \
            /* that can be added if needed, but it was like that since ever */          \
            break;

#define ResetForcedVariable_case_p(TYPENAME)                                            \
        case TYPENAME##_P_ENUM :                                                        \
        case TYPENAME##_O_ENUM :                                                        \
            ((__IEC_##TYPENAME##_p *)varp)->flags &= ~__IEC_FORCE_FLAG;                 \
            /* restore backup to pointer */                                             \
            ((__IEC_##TYPENAME##_p *)varp)->value =                                     \
                force_list_apply_cursor->value_pointer_backup;                          \
            break;

void ResetDebugVariables(void)
{
    /* Reset trace list */
    trace_list_addvar_cursor = trace_list;

    force_list_apply_cursor = force_list;
    /* Restore forced variables */
    while(force_list_apply_cursor < force_list_addvar_cursor){
        dbgvardsc_t *dsc = &dbgvardsc[
            force_list_apply_cursor->dbgvardsc_index];
        void *varp = dsc->ptr;
        switch(dsc->type){
            __ANY(ResetForcedVariable_case_t)
            __ANY(ResetForcedVariable_case_p)
        default:
            break;
        }
        /* inc force_list cursor */
        force_list_apply_cursor++;
    } /* else TODO: warn user about failure to force */ 

    /* Reset force list */
    force_list_addvar_cursor = force_list;
    /* Reset force buffer */
    force_buffer_cursor = force_buffer;
}

void FreeDebugData(void)
{
    /* atomically mark buffer as free */
    AtomicCompareExchange(
        &trace_buffer_state,
        BUFFER_FULL,
        BUFFER_EMPTY);
}
int WaitDebugData(unsigned long *tick);
/* Wait until debug data ready and return pointer to it */
int GetDebugData(unsigned long *tick, unsigned long *size, void **buffer){
    int wait_error = WaitDebugData(tick);
    if(!wait_error){
        *size = trace_buffer_cursor - trace_buffer;
        *buffer = trace_buffer;
    }
    return wait_error;
}
#endif
#endif

