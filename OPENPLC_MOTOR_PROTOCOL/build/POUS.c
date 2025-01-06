void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void MAIN_init__(MAIN *data__, BOOL retain) {
  TOF_init__(&data__->TOF0,retain);
  TON_init__(&data__->TON0,retain);
  __INIT_LOCATED(BOOL,__QX0_0,data__->BLINK_LED0,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED0,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_1,data__->BLINK_LED1,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX6_3,data__->BLINK_LED2,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED2,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->BLINK_LED3,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__QX0_4,data__->BLINK_LED4,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED4,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_5,data__->BLINK_LED5,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED5,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_6,data__->BLINK_LED6,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED6,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_7,data__->BLINK_LED7,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED7,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(INT,__IW0,data__->ANALOG_A0,retain)
  __INIT_LOCATED_VALUE(data__->ANALOG_A0,0)
  __INIT_LOCATED(INT,__IW1,data__->ANALOG_A1,retain)
  __INIT_LOCATED_VALUE(data__->ANALOG_A1,0)
  __INIT_LOCATED(INT,__IW2,data__->ANALOG_A2,retain)
  __INIT_LOCATED_VALUE(data__->ANALOG_A2,0)
  __INIT_LOCATED(INT,__IW3,data__->ANALOG_A3,retain)
  __INIT_LOCATED_VALUE(data__->ANALOG_A3,0)
  __INIT_VAR(data__->ANALOG_A0_VALUE,0,retain)
  __INIT_VAR(data__->ANALOG_A1_VALUE,0,retain)
  __INIT_VAR(data__->ANALOG_A2_VALUE,0,retain)
  __INIT_VAR(data__->ANALOG_A3_VALUE,0,retain)
  __INIT_VAR(data__->_TMP_MOVE15_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE2_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE14_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE19_OUT,0,retain)
}

// Code part
void MAIN_body__(MAIN *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TON0.,EN,,__BOOL_LITERAL(TRUE));
  __SET_VAR(data__->TON0.,IN,,!(__GET_LOCATED(data__->BLINK_LED0,)));
  __SET_VAR(data__->TON0.,PT,,__time_to_timespec(1, 500, 0, 0, 0, 0));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->TOF0.,EN,,__GET_VAR(data__->TON0.ENO,));
  __SET_VAR(data__->TOF0.,IN,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->TOF0.,PT,,__time_to_timespec(1, 500, 0, 0, 0, 0));
  TOF_body__(&data__->TOF0);
  __SET_LOCATED(data__->,BLINK_LED0,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->,_TMP_MOVE15_OUT,,MOVE__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_LOCATED(data__->ANALOG_A0,)));
  __SET_VAR(data__->,ANALOG_A0_VALUE,,__GET_VAR(data__->_TMP_MOVE15_OUT,));
  __SET_VAR(data__->,_TMP_MOVE2_OUT,,MOVE__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_LOCATED(data__->ANALOG_A1,)));
  __SET_VAR(data__->,ANALOG_A1_VALUE,,__GET_VAR(data__->_TMP_MOVE2_OUT,));
  __SET_VAR(data__->,_TMP_MOVE14_OUT,,MOVE__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_LOCATED(data__->ANALOG_A2,)));
  __SET_VAR(data__->,ANALOG_A2_VALUE,,__GET_VAR(data__->_TMP_MOVE14_OUT,));
  __SET_VAR(data__->,_TMP_MOVE19_OUT,,MOVE__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_LOCATED(data__->ANALOG_A3,)));
  __SET_VAR(data__->,ANALOG_A3_VALUE,,__GET_VAR(data__->_TMP_MOVE19_OUT,));
  __SET_LOCATED(data__->,BLINK_LED1,,__GET_VAR(data__->TOF0.Q,));
  __SET_LOCATED(data__->,BLINK_LED2,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->,BLINK_LED3,,__GET_VAR(data__->TOF0.Q,));

  goto __end;

__end:
  return;
} // MAIN_body__() 





static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD1(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE39_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE39_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __KIBAN_HANSO_MOVE__UINT__UINT2(BOOL EN,
  UINT IN,
  KIBAN_HANSO *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE41_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE41_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __KIBAN_HANSO_MOVE__UINT__UINT3(BOOL EN,
  UINT IN,
  KIBAN_HANSO *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE51_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE51_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __KIBAN_HANSO_MOVE__BYTE__BYTE4(BOOL EN,
  BYTE IN,
  KIBAN_HANSO *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE59_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE59_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __KIBAN_HANSO_EQ__BOOL__DWORD5(BOOL EN,
  UINT __PARAM_COUNT,
  DWORD IN1,
  DWORD IN2,
  KIBAN_HANSO *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ67_ENO,);
  __res = EQ__BOOL__DWORD(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ67_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD6(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE25_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE25_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __KIBAN_HANSO_MOVE__UINT__UINT7(BOOL EN,
  UINT IN,
  KIBAN_HANSO *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE29_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE29_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __KIBAN_HANSO_MOVE__UINT__UINT8(BOOL EN,
  UINT IN,
  KIBAN_HANSO *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE32_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE32_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __KIBAN_HANSO_MOVE__BYTE__BYTE9(BOOL EN,
  BYTE IN,
  KIBAN_HANSO *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE35_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE35_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __KIBAN_HANSO_EQ__BOOL__DWORD10(BOOL EN,
  UINT __PARAM_COUNT,
  DWORD IN1,
  DWORD IN2,
  KIBAN_HANSO *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_EQ43_ENO,);
  __res = EQ__BOOL__DWORD(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_EQ43_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD11(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE72_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE72_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD12(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE62_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE62_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD13(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE80_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE80_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD14(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE86_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE86_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __KIBAN_HANSO_MOVE__DWORD__DWORD15(BOOL EN,
  DWORD IN,
  KIBAN_HANSO *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE92_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE92_ENO,,__TMP_ENO);
  return __res;
}

void KIBAN_HANSO_init__(KIBAN_HANSO *data__, BOOL retain) {
  __INIT_VAR(data__->ITA_HANSO_START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_IL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_RUNNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_B0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_B1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_B2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ITA_HANSO_B3,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__IX0_0,data__->SENSOR_FIBER1,retain)
  __INIT_LOCATED_VALUE(data__->SENSOR_FIBER1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->SENSOR_FIBER2,retain)
  __INIT_LOCATED_VALUE(data__->SENSOR_FIBER2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_2,data__->SENSOR_METAL,retain)
  __INIT_LOCATED_VALUE(data__->SENSOR_METAL,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->ITA_KAKUNIN_OK,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->TON0,retain);
  TON_init__(&data__->TON1,retain);
  __INIT_VAR(data__->KIBAN_NAI_ERR,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR1_1,data__->POSITION_MOTOR1_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR2_1,data__->POSITION_MOTOR2_1,retain)
  __INIT_LOCATED(DWORD,__MD0,data__->IDOU_POS_HANSOU,retain)
  __INIT_LOCATED_VALUE(data__->IDOU_POS_HANSOU,30000)
  __INIT_LOCATED(DWORD,__MD1,data__->IDOU_POS_PICKUP,retain)
  __INIT_LOCATED_VALUE(data__->IDOU_POS_PICKUP,30000)
  __INIT_VAR(data__->EN_MOTOR1,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BOOL,CW_M1,data__->CW_M1,retain)
  __INIT_EXTERNAL(BOOL,CCW_M1,data__->CCW_M1,retain)
  __INIT_VAR(data__->CCW_M1_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M1_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO1,data__->DATA_MOTO1,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO2,data__->DATA_MOTO2,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M1_POS,data__->CURRENT_M1_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M2_POS,data__->CURRENT_M2_POS,retain)
  __INIT_VAR(data__->CURRENT_1_VITRI,0,retain)
  __INIT_EXTERNAL(UINT,MOTOR1_SPEED,data__->MOTOR1_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR2_SPEED,data__->MOTOR2_SPEED,retain)
  __INIT_VAR(data__->SET_MOTOR1_SPEED,0,retain)
  __INIT_VAR(data__->SET_MOTOR1_ACCEL,0,retain)
  __INIT_EXTERNAL(UINT,MOTOR1_ACCEL,data__->MOTOR1_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR2_ACCEL,data__->MOTOR2_ACCEL,retain)
  __INIT_VAR(data__->MODE_RUN_M1,0,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_1,data__->START_MOTO_1,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_2,data__->START_MOTO_2,retain)
  __INIT_EXTERNAL(BOOL,MOTOR1_RUNNING,data__->MOTOR1_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR1_POSITION_OK,data__->MOTOR1_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR2_POSITION_OK,data__->MOTOR2_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M1_KAKI_OK,data__->ZERO_M1_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,LR_0,data__->LR_0,retain)
  __INIT_EXTERNAL(BOOL,LR_1,data__->LR_1,retain)
  __INIT_EXTERNAL(BOOL,LR_2,data__->LR_2,retain)
  __INIT_EXTERNAL(BOOL,LR_3,data__->LR_3,retain)
  __INIT_EXTERNAL(DWORD,DM_0,data__->DM_0,retain)
  __INIT_EXTERNAL(DWORD,DM_1,data__->DM_1,retain)
  __INIT_EXTERNAL(DWORD,DM_2,data__->DM_2,retain)
  __INIT_EXTERNAL(DWORD,DM_3,data__->DM_3,retain)
  __INIT_EXTERNAL(DWORD,DM_4,data__->DM_4,retain)
  __INIT_VAR(data__->DM_INPUT0,0,retain)
  __INIT_VAR(data__->DM_INPUT1,0,retain)
  __INIT_VAR(data__->DM_INPUT2,0,retain)
  __INIT_VAR(data__->DM_INPUT3,0,retain)
  __INIT_VAR(data__->DM_INPUT4,0,retain)
  __INIT_VAR(data__->KB_HANSOU_IDOUOK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKUP_IDOUOK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKUP_SIJI,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAVE0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAVE1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAVE2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAVE3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAVE4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE39_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE39_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE41_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE41_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE51_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE51_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE59_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE59_OUT,0,retain)
  __INIT_VAR(data__->_TMP_EQ67_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ67_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE25_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE25_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE29_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE29_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE32_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE32_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE35_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE35_OUT,0,retain)
  __INIT_VAR(data__->_TMP_EQ43_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_EQ43_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE72_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE72_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE62_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE62_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE80_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE80_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE86_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE86_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE92_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE92_OUT,0,retain)
}

// Code part
void KIBAN_HANSO_body__(KIBAN_HANSO *data__) {
  // Initialise TEMP variables

  if ((!(__GET_VAR(data__->ITA_HANSO_IL,)) && __GET_VAR(data__->ITA_HANSO_START,))) {
    __SET_VAR(data__->,ITA_HANSO_RUNNING,,__BOOL_LITERAL(TRUE));
  };
  if ((!(__GET_VAR(data__->ITA_HANSO_IL,)) && __GET_VAR(data__->ITA_HANSO_START,))) {
    __SET_VAR(data__->,ITA_HANSO_B0,,__BOOL_LITERAL(TRUE));
  };
  if ((!(__GET_VAR(data__->ITA_HANSO_IL,)) && __GET_VAR(data__->ITA_HANSO_START,))) {
    __SET_VAR(data__->,ITA_HANSO_IL,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->TON0.,IN,,(((__GET_LOCATED(data__->SENSOR_FIBER1,) && __GET_VAR(data__->ITA_HANSO_B0,)) && __GET_VAR(data__->ITA_HANSO_RUNNING,)) && __GET_VAR(data__->ITA_HANSO_START,)));
  __SET_VAR(data__->TON0.,PT,,__time_to_timespec(1, 100, 0, 0, 0, 0));
  TON_body__(&data__->TON0);
  __SET_VAR(data__->,ITA_KAKUNIN_OK,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->TON1.,IN,,(((!(__GET_LOCATED(data__->SENSOR_FIBER1,)) && __GET_VAR(data__->ITA_HANSO_B0,)) && __GET_VAR(data__->ITA_HANSO_RUNNING,)) && __GET_VAR(data__->ITA_HANSO_START,)));
  __SET_VAR(data__->TON1.,PT,,__time_to_timespec(1, 5000, 0, 0, 0, 0));
  TON_body__(&data__->TON1);
  __SET_VAR(data__->,KIBAN_NAI_ERR,,__GET_VAR(data__->TON1.Q,));
  if (__GET_VAR(data__->TON0.Q,)) {
    __SET_VAR(data__->,ITA_HANSO_B1,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_VAR(data__->TON0.Q,)) {
    __SET_VAR(data__->,ITA_HANSO_B0,,__BOOL_LITERAL(FALSE));
  };
  if (__GET_VAR(data__->TON1.Q,)) {
    __SET_VAR(data__->,ITA_HANSO_START,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->,_TMP_MOVE39_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD1(
    (BOOL)__GET_VAR(data__->ITA_HANSO_B1,),
    (DWORD)__GET_EXTERNAL(data__->DM_0,),
    data__));
  __SET_EXTERNAL(data__->,START_MOTO_1,,__GET_VAR(data__->_TMP_MOVE39_ENO,));
  if (__GET_VAR(data__->_TMP_MOVE39_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR1_1,,__GET_VAR(data__->_TMP_MOVE39_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE41_OUT,,__KIBAN_HANSO_MOVE__UINT__UINT2(
    (BOOL)__GET_VAR(data__->ITA_HANSO_B1,),
    (UINT)5000,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE41_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR1_SPEED,,__GET_VAR(data__->_TMP_MOVE41_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE51_OUT,,__KIBAN_HANSO_MOVE__UINT__UINT3(
    (BOOL)__GET_VAR(data__->ITA_HANSO_B1,),
    (UINT)2000,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE51_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR1_ACCEL,,__GET_VAR(data__->_TMP_MOVE51_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE59_OUT,,__KIBAN_HANSO_MOVE__BYTE__BYTE4(
    (BOOL)__GET_VAR(data__->ITA_HANSO_B1,),
    (BYTE)8,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE59_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO1,,__GET_VAR(data__->_TMP_MOVE59_OUT,));
  };
  __SET_VAR(data__->,_TMP_EQ67_OUT,,__KIBAN_HANSO_EQ__BOOL__DWORD5(
    (BOOL)__GET_VAR(data__->ITA_HANSO_B1,),
    (UINT)2,
    (DWORD)__GET_EXTERNAL(data__->DM_0,),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M1_POS,),
    data__));
  if ((__GET_EXTERNAL(data__->MOTOR1_POSITION_OK,) && __GET_VAR(data__->_TMP_EQ67_OUT,))) {
    __SET_VAR(data__->,ITA_HANSO_B1,,__BOOL_LITERAL(FALSE));
  };
  if ((__GET_EXTERNAL(data__->MOTOR1_POSITION_OK,) && __GET_VAR(data__->_TMP_EQ67_OUT,))) {
    __SET_VAR(data__->,KB_HANSOU_IDOUOK,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,_TMP_MOVE25_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD6(
    (BOOL)__GET_VAR(data__->PICKUP_SIJI,),
    (DWORD)__GET_EXTERNAL(data__->DM_1,),
    data__));
  __SET_EXTERNAL(data__->,START_MOTO_2,,__GET_VAR(data__->_TMP_MOVE25_ENO,));
  if (__GET_VAR(data__->_TMP_MOVE25_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR2_1,,__GET_VAR(data__->_TMP_MOVE25_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE29_OUT,,__KIBAN_HANSO_MOVE__UINT__UINT7(
    (BOOL)__GET_VAR(data__->PICKUP_SIJI,),
    (UINT)5000,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE29_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR2_SPEED,,__GET_VAR(data__->_TMP_MOVE29_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE32_OUT,,__KIBAN_HANSO_MOVE__UINT__UINT8(
    (BOOL)__GET_VAR(data__->PICKUP_SIJI,),
    (UINT)2000,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE32_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR2_ACCEL,,__GET_VAR(data__->_TMP_MOVE32_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE35_OUT,,__KIBAN_HANSO_MOVE__BYTE__BYTE9(
    (BOOL)__GET_VAR(data__->PICKUP_SIJI,),
    (BYTE)8,
    data__));
  if (__GET_VAR(data__->_TMP_MOVE35_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO2,,__GET_VAR(data__->_TMP_MOVE35_OUT,));
  };
  __SET_VAR(data__->,_TMP_EQ43_OUT,,__KIBAN_HANSO_EQ__BOOL__DWORD10(
    (BOOL)__GET_VAR(data__->PICKUP_SIJI,),
    (UINT)2,
    (DWORD)__GET_EXTERNAL(data__->DM_1,),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M2_POS,),
    data__));
  if ((__GET_EXTERNAL(data__->MOTOR2_POSITION_OK,) && __GET_VAR(data__->_TMP_EQ43_OUT,))) {
    __SET_VAR(data__->,PICKUP_SIJI,,__BOOL_LITERAL(FALSE));
  };
  if ((__GET_EXTERNAL(data__->MOTOR2_POSITION_OK,) && __GET_VAR(data__->_TMP_EQ43_OUT,))) {
    __SET_VAR(data__->,PICKUP_IDOUOK,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,_TMP_MOVE72_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD11(
    (BOOL)__GET_VAR(data__->SAVE0,),
    (DWORD)__GET_VAR(data__->DM_INPUT0,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE72_ENO,)) {
    __SET_EXTERNAL(data__->,DM_0,,__GET_VAR(data__->_TMP_MOVE72_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE62_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD12(
    (BOOL)__GET_VAR(data__->SAVE1,),
    (DWORD)__GET_VAR(data__->DM_INPUT1,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE62_ENO,)) {
    __SET_EXTERNAL(data__->,DM_1,,__GET_VAR(data__->_TMP_MOVE62_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE80_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD13(
    (BOOL)__GET_VAR(data__->SAVE2,),
    (DWORD)__GET_VAR(data__->DM_INPUT2,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE80_ENO,)) {
    __SET_EXTERNAL(data__->,DM_2,,__GET_VAR(data__->_TMP_MOVE80_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE86_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD14(
    (BOOL)__GET_VAR(data__->SAVE3,),
    (DWORD)__GET_VAR(data__->DM_INPUT3,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE86_ENO,)) {
    __SET_EXTERNAL(data__->,DM_3,,__GET_VAR(data__->_TMP_MOVE86_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE92_OUT,,__KIBAN_HANSO_MOVE__DWORD__DWORD15(
    (BOOL)__GET_VAR(data__->SAVE4,),
    (DWORD)__GET_VAR(data__->DM_INPUT4,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE92_ENO,)) {
    __SET_EXTERNAL(data__->,DM_4,,__GET_VAR(data__->_TMP_MOVE92_OUT,));
  };

  goto __end;

__end:
  return;
} // KIBAN_HANSO_body__() 





