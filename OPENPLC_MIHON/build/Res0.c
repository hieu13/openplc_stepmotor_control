/*******************************************/
/*     FILE GENERATED BY iec2c             */
/* Editing this file is not recommended... */
/*******************************************/

#include "iec_std_lib.h"

// RESOURCE RES0

extern unsigned long long common_ticktime__;

#include "accessor.h"
#include "POUS.h"

#include "Config0.h"

#include "POUS.c"

BOOL TASK0;
BOOL TASK1;
PLC_STEP_PULSE_CTR RES0__INSTANCE0;
#define INSTANCE0 RES0__INSTANCE0
MAIN RES0__INSTANCE1;
#define INSTANCE1 RES0__INSTANCE1

void RES0_init__(void) {
  BOOL retain;
  retain = 0;
  
  TASK0 = __BOOL_LITERAL(FALSE);
  TASK1 = __BOOL_LITERAL(FALSE);
  PLC_STEP_PULSE_CTR_init__(&INSTANCE0,retain);
  MAIN_init__(&INSTANCE1,retain);
}

void RES0_run__(unsigned long tick) {
  TASK0 = !(tick % 1);
  TASK1 = !(tick % 2);
  if (TASK0) {
    PLC_STEP_PULSE_CTR_body__(&INSTANCE0);
  }
  if (TASK1) {
    MAIN_body__(&INSTANCE1);
  }
}

