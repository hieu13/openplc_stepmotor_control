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





static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD1(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE15_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE15_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE2(BOOL EN,
  BYTE IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE12_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE12_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD3(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE16_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE16_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT4(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE14_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE14_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT5(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE21_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE21_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL6(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE10_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE10_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL7(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE25_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE25_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL8(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE24_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE24_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL9(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE13_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE13_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD10(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE34_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE34_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE11(BOOL EN,
  BYTE IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE30_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE30_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD12(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE36_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE36_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT13(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE38_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE38_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT14(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE40_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE40_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL15(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE57_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE57_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL16(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE56_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE56_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD17(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE66_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE66_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE18(BOOL EN,
  BYTE IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE63_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE63_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD19(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE68_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE68_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT20(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE70_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE70_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT21(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE72_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE72_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL22(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE81_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE81_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL23(BOOL EN,
  BOOL IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE80_ENO,);
  __res = MOVE__BOOL__BOOL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE80_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD24(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE90_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE90_ENO,,__TMP_ENO);
  return __res;
}

static inline BYTE __PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE25(BOOL EN,
  BYTE IN,
  PLC_STEP_PULSE_CTR *data__)
{
  BYTE __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE87_ENO,);
  __res = MOVE__BYTE__BYTE(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE87_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD26(BOOL EN,
  DWORD IN,
  PLC_STEP_PULSE_CTR *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE92_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE92_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT27(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE94_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE94_ENO,,__TMP_ENO);
  return __res;
}

static inline UINT __PLC_STEP_PULSE_CTR_MOVE__UINT__UINT28(BOOL EN,
  UINT IN,
  PLC_STEP_PULSE_CTR *data__)
{
  UINT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE96_ENO,);
  __res = MOVE__UINT__UINT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE96_ENO,,__TMP_ENO);
  return __res;
}

void PLC_STEP_PULSE_CTR_init__(PLC_STEP_PULSE_CTR *data__, BOOL retain) {
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR1_1,data__->POSITION_MOTOR1_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR2_1,data__->POSITION_MOTOR2_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR3_1,data__->POSITION_MOTOR3_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR4_1,data__->POSITION_MOTOR4_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR5_1,data__->POSITION_MOTOR5_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR6_1,data__->POSITION_MOTOR6_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR7_1,data__->POSITION_MOTOR7_1,retain)
  __INIT_EXTERNAL(DWORD,POSITION_MOTOR8_1,data__->POSITION_MOTOR8_1,retain)
  __INIT_VAR(data__->STEP_1,0,retain)
  __INIT_VAR(data__->STEP_2,0,retain)
  __INIT_VAR(data__->STEP_3,0,retain)
  __INIT_VAR(data__->STEP_4,0,retain)
  __INIT_VAR(data__->STEP_5,0,retain)
  __INIT_VAR(data__->STEP_6,0,retain)
  __INIT_VAR(data__->STEP_7,0,retain)
  __INIT_VAR(data__->STEP_8,0,retain)
  __INIT_VAR(data__->EN_MOTOR1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EN_MOTOR8,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BOOL,CW_M1,data__->CW_M1,retain)
  __INIT_EXTERNAL(BOOL,CW_M2,data__->CW_M2,retain)
  __INIT_EXTERNAL(BOOL,CW_M3,data__->CW_M3,retain)
  __INIT_EXTERNAL(BOOL,CW_M4,data__->CW_M4,retain)
  __INIT_EXTERNAL(BOOL,CW_M5,data__->CW_M5,retain)
  __INIT_EXTERNAL(BOOL,CW_M6,data__->CW_M6,retain)
  __INIT_EXTERNAL(BOOL,CW_M7,data__->CW_M7,retain)
  __INIT_EXTERNAL(BOOL,CW_M8,data__->CW_M8,retain)
  __INIT_EXTERNAL(BOOL,CCW_M1,data__->CCW_M1,retain)
  __INIT_EXTERNAL(BOOL,CCW_M2,data__->CCW_M2,retain)
  __INIT_EXTERNAL(BOOL,CCW_M3,data__->CCW_M3,retain)
  __INIT_EXTERNAL(BOOL,CCW_M4,data__->CCW_M4,retain)
  __INIT_EXTERNAL(BOOL,CCW_M5,data__->CCW_M5,retain)
  __INIT_EXTERNAL(BOOL,CCW_M6,data__->CCW_M6,retain)
  __INIT_EXTERNAL(BOOL,CCW_M7,data__->CCW_M7,retain)
  __INIT_EXTERNAL(BOOL,CCW_M8,data__->CCW_M8,retain)
  __INIT_VAR(data__->CCW_M1_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M2_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M3_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M4_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M5_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M6_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M7_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CCW_M8_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M1_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M2_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M3_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M4_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M5_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M6_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M7_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CW_M8_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO1,data__->DATA_MOTO1,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO2,data__->DATA_MOTO2,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO3,data__->DATA_MOTO3,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO4,data__->DATA_MOTO4,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO5,data__->DATA_MOTO5,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO6,data__->DATA_MOTO6,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO7,data__->DATA_MOTO7,retain)
  __INIT_EXTERNAL(BYTE,DATA_MOTO8,data__->DATA_MOTO8,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M1_POS,data__->CURRENT_M1_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M2_POS,data__->CURRENT_M2_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M3_POS,data__->CURRENT_M3_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M4_POS,data__->CURRENT_M4_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M5_POS,data__->CURRENT_M5_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M6_POS,data__->CURRENT_M6_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M7_POS,data__->CURRENT_M7_POS,retain)
  __INIT_EXTERNAL(DWORD,CURRENT_M8_POS,data__->CURRENT_M8_POS,retain)
  __INIT_VAR(data__->CURRENT_1_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_2_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_3_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_4_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_5_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_6_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_7_VITRI,0,retain)
  __INIT_VAR(data__->CURRENT_8_VITRI,0,retain)
  __INIT_EXTERNAL(UINT,MOTOR1_SPEED,data__->MOTOR1_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR2_SPEED,data__->MOTOR2_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR3_SPEED,data__->MOTOR3_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR4_SPEED,data__->MOTOR4_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR5_SPEED,data__->MOTOR5_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR6_SPEED,data__->MOTOR6_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR7_SPEED,data__->MOTOR7_SPEED,retain)
  __INIT_EXTERNAL(UINT,MOTOR8_SPEED,data__->MOTOR8_SPEED,retain)
  __INIT_VAR(data__->SET_MOTOR1_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR2_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR3_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR4_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR5_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR6_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR7_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR8_SPEED,8000,retain)
  __INIT_VAR(data__->SET_MOTOR1_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR2_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR3_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR4_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR5_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR6_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR7_ACCEL,2000,retain)
  __INIT_VAR(data__->SET_MOTOR8_ACCEL,2000,retain)
  __INIT_EXTERNAL(UINT,MOTOR1_ACCEL,data__->MOTOR1_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR2_ACCEL,data__->MOTOR2_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR3_ACCEL,data__->MOTOR3_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR4_ACCEL,data__->MOTOR4_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR5_ACCEL,data__->MOTOR5_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR6_ACCEL,data__->MOTOR6_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR7_ACCEL,data__->MOTOR7_ACCEL,retain)
  __INIT_EXTERNAL(UINT,MOTOR8_ACCEL,data__->MOTOR8_ACCEL,retain)
  __INIT_VAR(data__->MODE_RUN_M1,0,retain)
  __INIT_VAR(data__->MODE_RUN_M2,0,retain)
  __INIT_VAR(data__->MODE_RUN_M3,0,retain)
  __INIT_VAR(data__->MODE_RUN_M4,0,retain)
  __INIT_VAR(data__->MODE_RUN_M5,0,retain)
  __INIT_VAR(data__->MODE_RUN_M6,0,retain)
  __INIT_VAR(data__->MODE_RUN_M7,0,retain)
  __INIT_VAR(data__->MODE_RUN_M8,0,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_1,data__->START_MOTO_1,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_2,data__->START_MOTO_2,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_3,data__->START_MOTO_3,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_4,data__->START_MOTO_4,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_5,data__->START_MOTO_5,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_6,data__->START_MOTO_6,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_7,data__->START_MOTO_7,retain)
  __INIT_EXTERNAL(BOOL,START_MOTO_8,data__->START_MOTO_8,retain)
  __INIT_EXTERNAL(BOOL,MOTOR1_RUNNING,data__->MOTOR1_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR2_RUNNING,data__->MOTOR2_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR3_RUNNING,data__->MOTOR3_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR4_RUNNING,data__->MOTOR4_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR5_RUNNING,data__->MOTOR5_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR6_RUNNING,data__->MOTOR6_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR7_RUNNING,data__->MOTOR7_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR8_RUNNING,data__->MOTOR8_RUNNING,retain)
  __INIT_EXTERNAL(BOOL,MOTOR1_POSITION_OK,data__->MOTOR1_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR2_POSITION_OK,data__->MOTOR2_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR3_POSITION_OK,data__->MOTOR3_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR4_POSITION_OK,data__->MOTOR4_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR5_POSITION_OK,data__->MOTOR5_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR6_POSITION_OK,data__->MOTOR6_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR7_POSITION_OK,data__->MOTOR7_POSITION_OK,retain)
  __INIT_EXTERNAL(BOOL,MOTOR8_POSITION_OK,data__->MOTOR8_POSITION_OK,retain)
  __INIT_VAR(data__->MOTOR1_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR2_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR3_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR4_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR5_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR6_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR7_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR8_RUNING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR1_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR2_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR3_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR4_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR5_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR6_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR7_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTOR8_POS_OK,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BOOL,ZERO_M1_KAKI_OK,data__->ZERO_M1_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M2_KAKI_OK,data__->ZERO_M2_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M3_KAKI_OK,data__->ZERO_M3_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M4_KAKI_OK,data__->ZERO_M4_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M5_KAKI_OK,data__->ZERO_M5_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M6_KAKI_OK,data__->ZERO_M6_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M7_KAKI_OK,data__->ZERO_M7_KAKI_OK,retain)
  __INIT_EXTERNAL(BOOL,ZERO_M8_KAKI_OK,data__->ZERO_M8_KAKI_OK,retain)
  __INIT_VAR(data__->_TMP_MOVE15_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE15_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE12_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE12_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE16_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE16_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE14_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE14_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE21_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE21_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE10_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE10_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE25_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE25_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE24_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE24_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE13_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE34_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE34_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE30_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE30_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE36_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE36_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE38_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE38_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE40_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE40_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE57_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE57_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE56_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE56_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE66_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE66_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE63_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE63_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE68_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE68_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE70_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE70_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE72_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE72_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE81_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE81_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE80_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE80_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE90_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE90_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE87_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE87_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE92_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE92_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE94_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE94_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE96_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE96_OUT,0,retain)
}

// Code part
void PLC_STEP_PULSE_CTR_body__(PLC_STEP_PULSE_CTR *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,_TMP_MOVE15_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD1(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_VAR(data__->STEP_1,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE15_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR1_1,,__GET_VAR(data__->_TMP_MOVE15_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE12_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE2(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BYTE)__GET_VAR(data__->MODE_RUN_M1,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE12_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO1,,__GET_VAR(data__->_TMP_MOVE12_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE16_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD3(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M1_POS,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE16_ENO,)) {
    __SET_VAR(data__->,CURRENT_1_VITRI,,__GET_VAR(data__->_TMP_MOVE16_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE14_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT4(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR1_SPEED,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE14_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR1_SPEED,,__GET_VAR(data__->_TMP_MOVE14_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE21_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT5(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR1_ACCEL,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE21_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR1_ACCEL,,__GET_VAR(data__->_TMP_MOVE21_OUT,));
  };
  __SET_EXTERNAL(data__->,START_MOTO_1,,__GET_VAR(data__->_TMP_MOVE15_ENO,));
  __SET_VAR(data__->,_TMP_MOVE10_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL6(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BOOL)__GET_EXTERNAL(data__->MOTOR1_RUNNING,),
    data__));
  __SET_VAR(data__->,_TMP_MOVE25_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL7(
    (BOOL)__GET_VAR(data__->_TMP_MOVE10_ENO,),
    (BOOL)__GET_EXTERNAL(data__->MOTOR1_POSITION_OK,),
    data__));
  __SET_VAR(data__->,MOTOR1_POS_OK,,__GET_VAR(data__->_TMP_MOVE25_OUT,));
  __SET_VAR(data__->,MOTOR1_RUNING,,__GET_VAR(data__->_TMP_MOVE10_OUT,));
  __SET_VAR(data__->,_TMP_MOVE24_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL8(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BOOL)__GET_EXTERNAL(data__->MOTOR2_RUNNING,),
    data__));
  __SET_VAR(data__->,_TMP_MOVE13_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL9(
    (BOOL)__GET_VAR(data__->_TMP_MOVE24_ENO,),
    (BOOL)__GET_EXTERNAL(data__->MOTOR2_POSITION_OK,),
    data__));
  __SET_VAR(data__->,MOTOR2_POS_OK,,__GET_VAR(data__->_TMP_MOVE13_OUT,));
  __SET_VAR(data__->,MOTOR2_RUNING,,__GET_VAR(data__->_TMP_MOVE24_OUT,));
  __SET_VAR(data__->,_TMP_MOVE34_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD10(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_VAR(data__->STEP_2,),
    data__));
  __SET_EXTERNAL(data__->,START_MOTO_2,,__GET_VAR(data__->_TMP_MOVE34_ENO,));
  if (__GET_VAR(data__->_TMP_MOVE34_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR2_1,,__GET_VAR(data__->_TMP_MOVE34_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE30_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE11(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BYTE)__GET_VAR(data__->MODE_RUN_M2,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE30_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO2,,__GET_VAR(data__->_TMP_MOVE30_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE36_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD12(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M2_POS,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE36_ENO,)) {
    __SET_VAR(data__->,CURRENT_2_VITRI,,__GET_VAR(data__->_TMP_MOVE36_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE38_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT13(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR2_SPEED,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE38_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR2_SPEED,,__GET_VAR(data__->_TMP_MOVE38_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE40_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT14(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR2_ACCEL,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE40_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR2_ACCEL,,__GET_VAR(data__->_TMP_MOVE40_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE57_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL15(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BOOL)__GET_EXTERNAL(data__->MOTOR3_RUNNING,),
    data__));
  __SET_VAR(data__->,_TMP_MOVE56_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL16(
    (BOOL)__GET_VAR(data__->_TMP_MOVE57_ENO,),
    (BOOL)__GET_EXTERNAL(data__->MOTOR3_POSITION_OK,),
    data__));
  __SET_VAR(data__->,MOTOR3_POS_OK,,__GET_VAR(data__->_TMP_MOVE56_OUT,));
  __SET_VAR(data__->,MOTOR3_RUNING,,__GET_VAR(data__->_TMP_MOVE57_OUT,));
  __SET_VAR(data__->,_TMP_MOVE66_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD17(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_VAR(data__->STEP_3,),
    data__));
  __SET_EXTERNAL(data__->,START_MOTO_3,,__GET_VAR(data__->_TMP_MOVE66_ENO,));
  if (__GET_VAR(data__->_TMP_MOVE66_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR3_1,,__GET_VAR(data__->_TMP_MOVE66_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE63_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE18(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BYTE)__GET_VAR(data__->MODE_RUN_M3,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE63_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO3,,__GET_VAR(data__->_TMP_MOVE63_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE68_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD19(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M3_POS,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE68_ENO,)) {
    __SET_VAR(data__->,CURRENT_3_VITRI,,__GET_VAR(data__->_TMP_MOVE68_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE70_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT20(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR3_SPEED,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE70_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR3_SPEED,,__GET_VAR(data__->_TMP_MOVE70_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE72_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT21(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR3_ACCEL,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE72_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR3_ACCEL,,__GET_VAR(data__->_TMP_MOVE72_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE81_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL22(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BOOL)__GET_EXTERNAL(data__->MOTOR4_RUNNING,),
    data__));
  __SET_VAR(data__->,_TMP_MOVE80_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BOOL__BOOL23(
    (BOOL)__GET_VAR(data__->_TMP_MOVE81_ENO,),
    (BOOL)__GET_EXTERNAL(data__->MOTOR4_POSITION_OK,),
    data__));
  __SET_VAR(data__->,MOTOR4_POS_OK,,__GET_VAR(data__->_TMP_MOVE80_OUT,));
  __SET_VAR(data__->,MOTOR4_RUNING,,__GET_VAR(data__->_TMP_MOVE81_OUT,));
  __SET_VAR(data__->,_TMP_MOVE90_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD24(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_VAR(data__->STEP_4,),
    data__));
  __SET_EXTERNAL(data__->,START_MOTO_4,,__GET_VAR(data__->_TMP_MOVE90_ENO,));
  if (__GET_VAR(data__->_TMP_MOVE90_ENO,)) {
    __SET_EXTERNAL(data__->,POSITION_MOTOR4_1,,__GET_VAR(data__->_TMP_MOVE90_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE87_OUT,,__PLC_STEP_PULSE_CTR_MOVE__BYTE__BYTE25(
    (BOOL)__BOOL_LITERAL(TRUE),
    (BYTE)__GET_VAR(data__->MODE_RUN_M4,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE87_ENO,)) {
    __SET_EXTERNAL(data__->,DATA_MOTO4,,__GET_VAR(data__->_TMP_MOVE87_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE92_OUT,,__PLC_STEP_PULSE_CTR_MOVE__DWORD__DWORD26(
    (BOOL)__BOOL_LITERAL(TRUE),
    (DWORD)__GET_EXTERNAL(data__->CURRENT_M4_POS,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE92_ENO,)) {
    __SET_VAR(data__->,CURRENT_4_VITRI,,__GET_VAR(data__->_TMP_MOVE92_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE94_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT27(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR4_SPEED,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE94_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR4_SPEED,,__GET_VAR(data__->_TMP_MOVE94_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE96_OUT,,__PLC_STEP_PULSE_CTR_MOVE__UINT__UINT28(
    (BOOL)__BOOL_LITERAL(TRUE),
    (UINT)__GET_VAR(data__->SET_MOTOR4_ACCEL,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE96_ENO,)) {
    __SET_EXTERNAL(data__->,MOTOR4_ACCEL,,__GET_VAR(data__->_TMP_MOVE96_OUT,));
  };

  goto __end;

__end:
  return;
} // PLC_STEP_PULSE_CTR_body__() 





static inline DWORD __MAIN_MOVE__DWORD__DWORD1(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE68_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE68_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD2(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE74_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE74_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD3(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE75_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE75_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD4(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE78_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE78_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD5(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE81_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE81_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD6(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE86_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE86_ENO,,__TMP_ENO);
  return __res;
}

static inline DWORD __MAIN_MOVE__DWORD__DWORD7(BOOL EN,
  DWORD IN,
  MAIN *data__)
{
  DWORD __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE89_ENO,);
  __res = MOVE__DWORD__DWORD(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE89_ENO,,__TMP_ENO);
  return __res;
}

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
  __INIT_LOCATED(BOOL,__IX0_0,data__->BUTTON0,retain)
  __INIT_LOCATED_VALUE(data__->BUTTON0,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_1,data__->BUTTON1,retain)
  __INIT_LOCATED_VALUE(data__->BUTTON1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_2,data__->BUTTON2,retain)
  __INIT_LOCATED_VALUE(data__->BUTTON2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__IX0_3,data__->BUTTON3,retain)
  __INIT_LOCATED_VALUE(data__->BUTTON3,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->BUTTON_TEM0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BUTTON_TEM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BUTTON_TEM2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BUTTON_TEM3,__BOOL_LITERAL(FALSE),retain)
  __INIT_LOCATED(BOOL,__QX1_0,data__->BLINK_LED8,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED8,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX1_1,data__->BLINK_LED9,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED9,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX1_2,data__->BLINK_LED10,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED10,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX1_3,data__->BLINK_LED11,retain)
  __INIT_LOCATED_VALUE(data__->BLINK_LED11,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->TEMP_COIL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TEMP_COIL0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TEMP_BT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TEMP_BT0,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(BOOL,LR_0,data__->LR_0,retain)
  __INIT_EXTERNAL(BOOL,LR_1,data__->LR_1,retain)
  __INIT_EXTERNAL(BOOL,LR_2,data__->LR_2,retain)
  __INIT_EXTERNAL(BOOL,LR_3,data__->LR_3,retain)
  __INIT_EXTERNAL(BOOL,LR_4,data__->LR_4,retain)
  __INIT_EXTERNAL(BOOL,LR_5,data__->LR_5,retain)
  __INIT_EXTERNAL(BOOL,LR_6,data__->LR_6,retain)
  __INIT_EXTERNAL(BOOL,LR_7,data__->LR_7,retain)
  __INIT_EXTERNAL(BOOL,LR_8,data__->LR_8,retain)
  __INIT_EXTERNAL(BOOL,LR_9,data__->LR_9,retain)
  __INIT_EXTERNAL(BOOL,LR_10,data__->LR_10,retain)
  __INIT_EXTERNAL(BOOL,LR_11,data__->LR_11,retain)
  __INIT_EXTERNAL(BOOL,LR_12,data__->LR_12,retain)
  __INIT_EXTERNAL(BOOL,LR_13,data__->LR_13,retain)
  __INIT_EXTERNAL(BOOL,LR_14,data__->LR_14,retain)
  __INIT_EXTERNAL(BOOL,LR_15,data__->LR_15,retain)
  __INIT_EXTERNAL(DWORD,DM_0,data__->DM_0,retain)
  __INIT_EXTERNAL(DWORD,DM_1,data__->DM_1,retain)
  __INIT_EXTERNAL(DWORD,DM_2,data__->DM_2,retain)
  __INIT_EXTERNAL(DWORD,DM_3,data__->DM_3,retain)
  __INIT_EXTERNAL(DWORD,DM_4,data__->DM_4,retain)
  __INIT_EXTERNAL(DWORD,DM_5,data__->DM_5,retain)
  __INIT_EXTERNAL(DWORD,DM_6,data__->DM_6,retain)
  __INIT_EXTERNAL(DWORD,DM_7,data__->DM_7,retain)
  __INIT_EXTERNAL(DWORD,DM_8,data__->DM_8,retain)
  __INIT_EXTERNAL(DWORD,DM_9,data__->DM_9,retain)
  __INIT_EXTERNAL(DWORD,DM_10,data__->DM_10,retain)
  __INIT_EXTERNAL(DWORD,DM_11,data__->DM_11,retain)
  __INIT_EXTERNAL(DWORD,DM_12,data__->DM_12,retain)
  __INIT_EXTERNAL(DWORD,DM_13,data__->DM_13,retain)
  __INIT_EXTERNAL(DWORD,DM_14,data__->DM_14,retain)
  __INIT_EXTERNAL(DWORD,DM_15,data__->DM_15,retain)
  __INIT_EXTERNAL(DWORD,DM_16,data__->DM_16,retain)
  __INIT_EXTERNAL(DWORD,DM_17,data__->DM_17,retain)
  __INIT_EXTERNAL(DWORD,DM_18,data__->DM_18,retain)
  __INIT_EXTERNAL(DWORD,DM_19,data__->DM_19,retain)
  __INIT_VAR(data__->TEMP_1,0,retain)
  __INIT_VAR(data__->TEMP_2,0,retain)
  __INIT_VAR(data__->TEMP_3,0,retain)
  __INIT_VAR(data__->TEMP_4,0,retain)
  __INIT_VAR(data__->TEMP_5,0,retain)
  __INIT_VAR(data__->TEMP_6,0,retain)
  __INIT_VAR(data__->TEMP_7,0,retain)
  __INIT_VAR(data__->TEST,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TEST0,0,retain)
  __INIT_VAR(data__->TEST1,0,retain)
  __INIT_VAR(data__->TEST2,0,retain)
  __INIT_VAR(data__->TEST3,0,retain)
  __INIT_VAR(data__->TEST4,0,retain)
  __INIT_VAR(data__->TEST5,0,retain)
  __INIT_VAR(data__->TEST6,0,retain)
  __INIT_VAR(data__->TEST7,0,retain)
  __INIT_VAR(data__->COIL_LR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_LR0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_LR1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_LR2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COIL_LR3,__BOOL_LITERAL(FALSE),retain)
  __INIT_EXTERNAL(UINT,COIL_256,data__->COIL_256,retain)
  __INIT_VAR(data__->COIL_257,0,retain)
  __INIT_VAR(data__->_TMP_MOVE15_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE2_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE14_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE19_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE57_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE60_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE63_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE66_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE68_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE68_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE74_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE74_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE75_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE75_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE78_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE78_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE81_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE81_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE86_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE86_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE89_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE89_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE93_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE96_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE99_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE108_OUT,0,retain)
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
  __SET_LOCATED(data__->,BLINK_LED4,,__GET_LOCATED(data__->BUTTON0,));
  __SET_LOCATED(data__->,BLINK_LED5,,__GET_LOCATED(data__->BUTTON1,));
  __SET_LOCATED(data__->,BLINK_LED6,,__GET_LOCATED(data__->BUTTON2,));
  __SET_LOCATED(data__->,BLINK_LED7,,__GET_LOCATED(data__->BUTTON3,));
  __SET_LOCATED(data__->,BLINK_LED8,,__GET_VAR(data__->BUTTON_TEM0,));
  __SET_LOCATED(data__->,BLINK_LED9,,__GET_VAR(data__->BUTTON_TEM1,));
  __SET_LOCATED(data__->,BLINK_LED10,,__GET_VAR(data__->BUTTON_TEM2,));
  __SET_LOCATED(data__->,BLINK_LED11,,__GET_VAR(data__->BUTTON_TEM3,));
  if (__GET_LOCATED(data__->BLINK_LED4,)) {
    __SET_VAR(data__->,BUTTON_TEM0,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_LOCATED(data__->BLINK_LED5,)) {
    __SET_VAR(data__->,BUTTON_TEM1,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_LOCATED(data__->BLINK_LED6,)) {
    __SET_VAR(data__->,BUTTON_TEM2,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_LOCATED(data__->BLINK_LED7,)) {
    __SET_VAR(data__->,BUTTON_TEM3,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_VAR(data__->TEMP_BT,)) {
    __SET_VAR(data__->,TEMP_COIL,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_VAR(data__->TEMP_BT0,)) {
    __SET_VAR(data__->,TEMP_COIL0,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,_TMP_MOVE57_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_0,)));
  __SET_VAR(data__->,TEMP_1,,__GET_VAR(data__->_TMP_MOVE57_OUT,));
  __SET_VAR(data__->,_TMP_MOVE60_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_1,)));
  __SET_VAR(data__->,TEMP_2,,__GET_VAR(data__->_TMP_MOVE60_OUT,));
  __SET_VAR(data__->,_TMP_MOVE63_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_2,)));
  __SET_VAR(data__->,TEMP_3,,__GET_VAR(data__->_TMP_MOVE63_OUT,));
  __SET_VAR(data__->,_TMP_MOVE66_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_5,)));
  __SET_VAR(data__->,TEMP_4,,__GET_VAR(data__->_TMP_MOVE66_OUT,));
  __SET_VAR(data__->,_TMP_MOVE68_OUT,,__MAIN_MOVE__DWORD__DWORD1(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST0,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE68_ENO,)) {
    __SET_EXTERNAL(data__->,DM_0,,__GET_VAR(data__->_TMP_MOVE68_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE74_OUT,,__MAIN_MOVE__DWORD__DWORD2(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST1,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE74_ENO,)) {
    __SET_EXTERNAL(data__->,DM_1,,__GET_VAR(data__->_TMP_MOVE74_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE75_OUT,,__MAIN_MOVE__DWORD__DWORD3(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST2,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE75_ENO,)) {
    __SET_EXTERNAL(data__->,DM_2,,__GET_VAR(data__->_TMP_MOVE75_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE78_OUT,,__MAIN_MOVE__DWORD__DWORD4(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST3,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE78_ENO,)) {
    __SET_EXTERNAL(data__->,DM_5,,__GET_VAR(data__->_TMP_MOVE78_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE81_OUT,,__MAIN_MOVE__DWORD__DWORD5(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST4,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE81_ENO,)) {
    __SET_EXTERNAL(data__->,DM_10,,__GET_VAR(data__->_TMP_MOVE81_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE86_OUT,,__MAIN_MOVE__DWORD__DWORD6(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST5,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE86_ENO,)) {
    __SET_EXTERNAL(data__->,DM_15,,__GET_VAR(data__->_TMP_MOVE86_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE89_OUT,,__MAIN_MOVE__DWORD__DWORD7(
    (BOOL)__GET_VAR(data__->TEST,),
    (DWORD)__GET_VAR(data__->TEST6,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE89_ENO,)) {
    __SET_EXTERNAL(data__->,DM_19,,__GET_VAR(data__->_TMP_MOVE89_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE93_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_10,)));
  __SET_VAR(data__->,TEMP_5,,__GET_VAR(data__->_TMP_MOVE93_OUT,));
  __SET_VAR(data__->,_TMP_MOVE96_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_15,)));
  __SET_VAR(data__->,TEMP_6,,__GET_VAR(data__->_TMP_MOVE96_OUT,));
  __SET_VAR(data__->,_TMP_MOVE99_OUT,,MOVE__DWORD__DWORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->DM_19,)));
  __SET_VAR(data__->,TEMP_7,,__GET_VAR(data__->_TMP_MOVE99_OUT,));
  if (__GET_VAR(data__->COIL_LR,)) {
    __SET_EXTERNAL(data__->,LR_0,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_VAR(data__->COIL_LR0,)) {
    __SET_EXTERNAL(data__->,LR_1,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,COIL_LR3,,__GET_EXTERNAL(data__->LR_7,));
  __SET_VAR(data__->,_TMP_MOVE108_OUT,,MOVE__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)__GET_EXTERNAL(data__->COIL_256,)));
  __SET_VAR(data__->,COIL_257,,__GET_VAR(data__->_TMP_MOVE108_OUT,));
  if (__GET_VAR(data__->COIL_LR1,)) {
    __SET_EXTERNAL(data__->,LR_7,,__BOOL_LITERAL(FALSE));
  };
  if (__GET_VAR(data__->COIL_LR2,)) {
    __SET_EXTERNAL(data__->,LR_7,,__BOOL_LITERAL(TRUE));
  };

  goto __end;

__end:
  return;
} // MAIN_body__() 





