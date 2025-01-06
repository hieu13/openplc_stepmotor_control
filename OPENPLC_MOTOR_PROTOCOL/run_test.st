PROGRAM PLC_STEP_PULSE_CTR
  VAR_EXTERNAL
    position_motor1_1 : DWORD;
    position_motor2_1 : DWORD;
    position_motor3_1 : DWORD;
    position_motor4_1 : DWORD;
    position_motor1_2 : DWORD;
    position_motor2_2 : DWORD;
    position_motor3_2 : DWORD;
    position_motor4_2 : DWORD;
    position_motor1_3 : DWORD;
    position_motor2_3 : DWORD;
    position_motor3_3 : DWORD;
    position_motor4_3 : DWORD;
  END_VAR
  VAR
    step_1 : DWORD;
    step_2 : DWORD;
    step_3 : DWORD;
    step_4 : DWORD;
    en_motor1 : BOOL;
    en_motor2 : BOOL;
    en_motor3 : BOOL;
    en_motor4 : BOOL;
  END_VAR
  VAR_EXTERNAL
    cw_m1 : BOOL;
    cw_m2 : BOOL;
    cw_m3 : BOOL;
    cw_m4 : BOOL;
    ccw_m1 : BOOL;
    ccw_m2 : BOOL;
    ccw_m3 : BOOL;
    ccw_m4 : BOOL;
  END_VAR
  VAR
    ccw_m1_on : BOOL;
    ccw_m2_on : BOOL;
    ccw_m3_on : BOOL;
    ccw_m4_on : BOOL;
    cw_m1_on : BOOL;
    cw_m2_on : BOOL;
    cw_m3_on : BOOL;
    cw_m4_on : BOOL;
  END_VAR
  VAR_EXTERNAL
    data_moto1 : BYTE;
    data_moto2 : BYTE;
    data_moto3 : BYTE;
    data_moto4 : BYTE;
    current_motor_1_position : DWORD;
    current_motor_2_position : DWORD;
    current_motor_3_position : DWORD;
    current_motor_4_position : DWORD;
  END_VAR
  VAR
    current_1_vitri : DWORD;
    current_2_vitri : DWORD;
    current_3_vitri : DWORD;
    current_4_vitri : DWORD;
  END_VAR
  VAR_EXTERNAL
    motor1_speed : UINT;
    motor2_speed : UINT;
    motor3_speed : UINT;
    motor4_speed : UINT;
  END_VAR
  VAR
    set_motor1_speed : UINT := 8000;
    set_motor2_speed : UINT := 8000;
    set_motor3_speed : UINT := 8000;
    set_motor4_speed : UINT := 8000;
    set_motor1_accel : UINT := 2000;
    set_motor2_accel : UINT := 2000;
    set_motor3_accel : UINT := 2000;
    set_motor4_accel : UINT := 2000;
  END_VAR
  VAR_EXTERNAL
    motor1_accel : UINT;
    motor2_accel : UINT;
    motor3_accel : UINT;
    motor4_accel : UINT;
  END_VAR
  VAR
    mode_run_m1 : BYTE;
    mode_run_m2 : BYTE;
    mode_run_m3 : BYTE;
    mode_run_m4 : BYTE;
  END_VAR
  VAR_EXTERNAL
    START_Moto_1 : BOOL;
    START_Moto_2 : BOOL;
    START_Moto_3 : BOOL;
    START_Moto_4 : BOOL;
    motor1_running : BOOL;
    motor2_running : BOOL;
    motor3_running : BOOL;
    motor4_running : BOOL;
    motor1_position_ok : BOOL;
    motor2_position_ok : BOOL;
    motor3_position_ok : BOOL;
    motor4_position_ok : BOOL;
  END_VAR
  VAR
    MOTOR1_RUNING : BOOL;
    MOTOR2_RUNING : BOOL;
    MOTOR3_RUNING : BOOL;
    MOTOR4_RUNING : BOOL;
    MOTOR1_POS_ok : BOOL;
    MOTOR2_POS_ok : BOOL;
    MOTOR3_POS_ok : BOOL;
    MOTOR4_POS_ok : BOOL;
  END_VAR
  VAR_EXTERNAL
    zero_m1_kaki_ok : BOOL;
    zero_m2_kaki_ok : BOOL;
    zero_m3_kaki_ok : BOOL;
    zero_m4_kaki_ok : BOOL;
  END_VAR
  VAR
    _TMP_MOVE15_ENO : BOOL;
    _TMP_MOVE15_OUT : DWORD;
    _TMP_MOVE12_ENO : BOOL;
    _TMP_MOVE12_OUT : BYTE;
    _TMP_MOVE16_ENO : BOOL;
    _TMP_MOVE16_OUT : DWORD;
    _TMP_MOVE14_ENO : BOOL;
    _TMP_MOVE14_OUT : UINT;
    _TMP_MOVE21_ENO : BOOL;
    _TMP_MOVE21_OUT : UINT;
    _TMP_MOVE10_ENO : BOOL;
    _TMP_MOVE10_OUT : BOOL;
    _TMP_MOVE25_ENO : BOOL;
    _TMP_MOVE25_OUT : BOOL;
    _TMP_MOVE24_ENO : BOOL;
    _TMP_MOVE24_OUT : BOOL;
    _TMP_MOVE13_ENO : BOOL;
    _TMP_MOVE13_OUT : BOOL;
    _TMP_MOVE34_ENO : BOOL;
    _TMP_MOVE34_OUT : DWORD;
    _TMP_MOVE30_ENO : BOOL;
    _TMP_MOVE30_OUT : BYTE;
    _TMP_MOVE36_ENO : BOOL;
    _TMP_MOVE36_OUT : DWORD;
    _TMP_MOVE38_ENO : BOOL;
    _TMP_MOVE38_OUT : UINT;
    _TMP_MOVE40_ENO : BOOL;
    _TMP_MOVE40_OUT : UINT;
    _TMP_MOVE57_ENO : BOOL;
    _TMP_MOVE57_OUT : BOOL;
    _TMP_MOVE56_ENO : BOOL;
    _TMP_MOVE56_OUT : BOOL;
    _TMP_MOVE66_ENO : BOOL;
    _TMP_MOVE66_OUT : DWORD;
    _TMP_MOVE63_ENO : BOOL;
    _TMP_MOVE63_OUT : BYTE;
    _TMP_MOVE68_ENO : BOOL;
    _TMP_MOVE68_OUT : DWORD;
    _TMP_MOVE70_ENO : BOOL;
    _TMP_MOVE70_OUT : UINT;
    _TMP_MOVE72_ENO : BOOL;
    _TMP_MOVE72_OUT : UINT;
    _TMP_MOVE81_ENO : BOOL;
    _TMP_MOVE81_OUT : BOOL;
    _TMP_MOVE80_ENO : BOOL;
    _TMP_MOVE80_OUT : BOOL;
    _TMP_MOVE90_ENO : BOOL;
    _TMP_MOVE90_OUT : DWORD;
    _TMP_MOVE87_ENO : BOOL;
    _TMP_MOVE87_OUT : BYTE;
    _TMP_MOVE92_ENO : BOOL;
    _TMP_MOVE92_OUT : DWORD;
    _TMP_MOVE94_ENO : BOOL;
    _TMP_MOVE94_OUT : UINT;
    _TMP_MOVE96_ENO : BOOL;
    _TMP_MOVE96_OUT : UINT;
  END_VAR

  _TMP_MOVE15_OUT := MOVE(EN := TRUE, IN := step_1, ENO => _TMP_MOVE15_ENO);
  IF _TMP_MOVE15_ENO THEN
      position_motor1_1 := _TMP_MOVE15_OUT;
  END_IF;
  _TMP_MOVE12_OUT := MOVE(EN := TRUE, IN := mode_run_m1, ENO => _TMP_MOVE12_ENO);
  IF _TMP_MOVE12_ENO THEN
      data_moto1 := _TMP_MOVE12_OUT;
  END_IF;
  _TMP_MOVE16_OUT := MOVE(EN := TRUE, IN := current_motor_1_position, ENO => _TMP_MOVE16_ENO);
  IF _TMP_MOVE16_ENO THEN
      current_1_vitri := _TMP_MOVE16_OUT;
  END_IF;
  _TMP_MOVE14_OUT := MOVE(EN := TRUE, IN := set_motor1_speed, ENO => _TMP_MOVE14_ENO);
  IF _TMP_MOVE14_ENO THEN
      motor1_speed := _TMP_MOVE14_OUT;
  END_IF;
  _TMP_MOVE21_OUT := MOVE(EN := TRUE, IN := set_motor1_accel, ENO => _TMP_MOVE21_ENO);
  IF _TMP_MOVE21_ENO THEN
      motor1_accel := _TMP_MOVE21_OUT;
  END_IF;
  START_Moto_1 := _TMP_MOVE15_ENO;
  _TMP_MOVE10_OUT := MOVE(EN := TRUE, IN := motor1_running, ENO => _TMP_MOVE10_ENO);
  _TMP_MOVE25_OUT := MOVE(EN := _TMP_MOVE10_ENO, IN := motor1_position_ok, ENO => _TMP_MOVE25_ENO);
  MOTOR1_POS_ok := _TMP_MOVE25_OUT;
  MOTOR1_RUNING := _TMP_MOVE10_OUT;
  _TMP_MOVE24_OUT := MOVE(EN := TRUE, IN := motor2_running, ENO => _TMP_MOVE24_ENO);
  _TMP_MOVE13_OUT := MOVE(EN := _TMP_MOVE24_ENO, IN := motor2_position_ok, ENO => _TMP_MOVE13_ENO);
  MOTOR2_POS_ok := _TMP_MOVE13_OUT;
  MOTOR2_RUNING := _TMP_MOVE24_OUT;
  _TMP_MOVE34_OUT := MOVE(EN := TRUE, IN := step_2, ENO => _TMP_MOVE34_ENO);
  START_Moto_2 := _TMP_MOVE34_ENO;
  IF _TMP_MOVE34_ENO THEN
      position_motor2_1 := _TMP_MOVE34_OUT;
  END_IF;
  _TMP_MOVE30_OUT := MOVE(EN := TRUE, IN := mode_run_m2, ENO => _TMP_MOVE30_ENO);
  IF _TMP_MOVE30_ENO THEN
      data_moto2 := _TMP_MOVE30_OUT;
  END_IF;
  _TMP_MOVE36_OUT := MOVE(EN := TRUE, IN := current_motor_2_position, ENO => _TMP_MOVE36_ENO);
  IF _TMP_MOVE36_ENO THEN
      current_2_vitri := _TMP_MOVE36_OUT;
  END_IF;
  _TMP_MOVE38_OUT := MOVE(EN := TRUE, IN := set_motor2_speed, ENO => _TMP_MOVE38_ENO);
  IF _TMP_MOVE38_ENO THEN
      motor2_speed := _TMP_MOVE38_OUT;
  END_IF;
  _TMP_MOVE40_OUT := MOVE(EN := TRUE, IN := set_motor2_accel, ENO => _TMP_MOVE40_ENO);
  IF _TMP_MOVE40_ENO THEN
      motor2_accel := _TMP_MOVE40_OUT;
  END_IF;
  _TMP_MOVE57_OUT := MOVE(EN := TRUE, IN := motor3_running, ENO => _TMP_MOVE57_ENO);
  _TMP_MOVE56_OUT := MOVE(EN := _TMP_MOVE57_ENO, IN := motor3_position_ok, ENO => _TMP_MOVE56_ENO);
  MOTOR3_POS_ok := _TMP_MOVE56_OUT;
  MOTOR3_RUNING := _TMP_MOVE57_OUT;
  _TMP_MOVE66_OUT := MOVE(EN := TRUE, IN := step_3, ENO => _TMP_MOVE66_ENO);
  START_Moto_3 := _TMP_MOVE66_ENO;
  IF _TMP_MOVE66_ENO THEN
      position_motor3_1 := _TMP_MOVE66_OUT;
  END_IF;
  _TMP_MOVE63_OUT := MOVE(EN := TRUE, IN := mode_run_m3, ENO => _TMP_MOVE63_ENO);
  IF _TMP_MOVE63_ENO THEN
      data_moto3 := _TMP_MOVE63_OUT;
  END_IF;
  _TMP_MOVE68_OUT := MOVE(EN := TRUE, IN := current_motor_3_position, ENO => _TMP_MOVE68_ENO);
  IF _TMP_MOVE68_ENO THEN
      current_3_vitri := _TMP_MOVE68_OUT;
  END_IF;
  _TMP_MOVE70_OUT := MOVE(EN := TRUE, IN := set_motor3_speed, ENO => _TMP_MOVE70_ENO);
  IF _TMP_MOVE70_ENO THEN
      motor3_speed := _TMP_MOVE70_OUT;
  END_IF;
  _TMP_MOVE72_OUT := MOVE(EN := TRUE, IN := set_motor3_accel, ENO => _TMP_MOVE72_ENO);
  IF _TMP_MOVE72_ENO THEN
      motor3_accel := _TMP_MOVE72_OUT;
  END_IF;
  _TMP_MOVE81_OUT := MOVE(EN := TRUE, IN := motor4_running, ENO => _TMP_MOVE81_ENO);
  _TMP_MOVE80_OUT := MOVE(EN := _TMP_MOVE81_ENO, IN := motor4_position_ok, ENO => _TMP_MOVE80_ENO);
  MOTOR4_POS_ok := _TMP_MOVE80_OUT;
  MOTOR4_RUNING := _TMP_MOVE81_OUT;
  _TMP_MOVE90_OUT := MOVE(EN := TRUE, IN := step_4, ENO => _TMP_MOVE90_ENO);
  START_Moto_4 := _TMP_MOVE90_ENO;
  IF _TMP_MOVE90_ENO THEN
      position_motor4_1 := _TMP_MOVE90_OUT;
  END_IF;
  _TMP_MOVE87_OUT := MOVE(EN := TRUE, IN := mode_run_m4, ENO => _TMP_MOVE87_ENO);
  IF _TMP_MOVE87_ENO THEN
      data_moto4 := _TMP_MOVE87_OUT;
  END_IF;
  _TMP_MOVE92_OUT := MOVE(EN := TRUE, IN := current_motor_4_position, ENO => _TMP_MOVE92_ENO);
  IF _TMP_MOVE92_ENO THEN
      current_4_vitri := _TMP_MOVE92_OUT;
  END_IF;
  _TMP_MOVE94_OUT := MOVE(EN := TRUE, IN := set_motor4_speed, ENO => _TMP_MOVE94_ENO);
  IF _TMP_MOVE94_ENO THEN
      motor4_speed := _TMP_MOVE94_OUT;
  END_IF;
  _TMP_MOVE96_OUT := MOVE(EN := TRUE, IN := set_motor4_accel, ENO => _TMP_MOVE96_ENO);
  IF _TMP_MOVE96_ENO THEN
      motor4_accel := _TMP_MOVE96_OUT;
  END_IF;
END_PROGRAM

PROGRAM main
  VAR
    TOF0 : TOF;
    TON0 : TON;
  END_VAR
  VAR
    blink_led0 AT %QX0.0 : BOOL;
    blink_led1 AT %QX0.1 : BOOL;
    blink_led2 AT %QX0.2 : BOOL;
    blink_led3 AT %QX0.3 : BOOL;
    blink_led4 AT %QX0.4 : BOOL;
    blink_led5 AT %QX0.5 : BOOL;
    blink_led6 AT %QX0.6 : BOOL;
    blink_led7 AT %QX0.7 : BOOL;
    Analog_A0 AT %IW0 : INT;
    Analog_A1 AT %IW1 : INT;
    Analog_A2 AT %IW2 : INT;
    Analog_A3 AT %IW3 : INT;
  END_VAR
  VAR
    Analog_A0_value : INT;
    Analog_A1_value : INT;
    Analog_A2_value : INT;
    Analog_A3_value : INT;
  END_VAR
  VAR
    button0 AT %IX0.0 : BOOL;
    button1 AT %IX0.1 : BOOL;
    button2 AT %IX0.2 : BOOL;
    button3 AT %IX0.3 : BOOL;
  END_VAR
  VAR
    button_tem0 : BOOL;
    button_tem1 : BOOL;
    button_tem2 : BOOL;
    button_tem3 : BOOL;
  END_VAR
  VAR
    blink_led8 AT %QX1.0 : BOOL;
    blink_led9 AT %QX1.1 : BOOL;
    blink_led10 AT %QX1.2 : BOOL;
    blink_led11 AT %QX1.3 : BOOL;
  END_VAR
  VAR
    _TMP_MOVE15_OUT : INT;
    _TMP_MOVE2_OUT : INT;
    _TMP_MOVE14_OUT : INT;
    _TMP_MOVE19_OUT : INT;
  END_VAR

  TON0(EN := TRUE, IN := NOT(blink_led0), PT := T#500ms);
  TOF0(EN := TON0.ENO, IN := TON0.Q, PT := T#500ms);
  blink_led0 := TOF0.Q;
  _TMP_MOVE15_OUT := MOVE(Analog_A0);
  Analog_A0_value := _TMP_MOVE15_OUT;
  _TMP_MOVE2_OUT := MOVE(Analog_A1);
  Analog_A1_value := _TMP_MOVE2_OUT;
  _TMP_MOVE14_OUT := MOVE(Analog_A2);
  Analog_A2_value := _TMP_MOVE14_OUT;
  _TMP_MOVE19_OUT := MOVE(Analog_A3);
  Analog_A3_value := _TMP_MOVE19_OUT;
  blink_led1 := TOF0.Q;
  blink_led2 := TOF0.Q;
  blink_led3 := TOF0.Q;
  blink_led4 := button0;
  blink_led5 := button1;
  blink_led6 := button2;
  blink_led7 := button3;
  blink_led8 := button_tem0;
  blink_led9 := button_tem1;
  blink_led10 := button_tem2;
  blink_led11 := button_tem3;
  IF blink_led4 THEN
    button_tem0 := TRUE; (*set*)
  END_IF;
  IF blink_led5 THEN
    button_tem1 := TRUE; (*set*)
  END_IF;
  IF blink_led6 THEN
    button_tem2 := TRUE; (*set*)
  END_IF;
  IF blink_led7 THEN
    button_tem3 := TRUE; (*set*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0
  VAR_GLOBAL
    SerialRCV : BYTE;
    zero_m1_kaki_ok : BOOL;
    zero_m2_kaki_ok : BOOL;
    zero_m3_kaki_ok : BOOL;
    zero_m4_kaki_ok : BOOL;
    PrintMSG : BOOL;
    position_motor1_1 : DWORD;
    position_motor2_1 : DWORD;
    position_motor3_1 : DWORD;
    position_motor4_1 : DWORD;
    position_motor1_2 : DWORD;
    position_motor2_2 : DWORD;
    position_motor3_2 : DWORD;
    position_motor4_2 : DWORD;
    position_motor1_3 : DWORD;
    position_motor2_3 : DWORD;
    position_motor3_3 : DWORD;
    position_motor4_3 : DWORD;
    cw_m1 : BOOL;
    cw_m2 : BOOL;
    cw_m3 : BOOL;
    cw_m4 : BOOL;
    ccw_m1 : BOOL;
    ccw_m2 : BOOL;
    ccw_m3 : BOOL;
    ccw_m4 : BOOL;
    data_moto1 : BYTE;
    data_moto2 : BYTE;
    data_moto3 : BYTE;
    data_moto4 : BYTE;
    SerialMSG : STRING;
    current_motor_1_position : DWORD;
    current_motor_2_position : DWORD;
    current_motor_3_position : DWORD;
    current_motor_4_position : DWORD;
    motor1_speed : UINT;
    motor2_speed : UINT;
    motor3_speed : UINT;
    motor4_speed : UINT;
    motor1_accel : UINT;
    motor2_accel : UINT;
    motor3_accel : UINT;
    motor4_accel : UINT;
    START_Moto_1 : BOOL;
    START_Moto_2 : BOOL;
    START_Moto_3 : BOOL;
    START_Moto_4 : BOOL;
    motor1_running : BOOL;
    motor2_running : BOOL;
    motor3_running : BOOL;
    motor4_running : BOOL;
    motor1_position_ok : BOOL;
    motor2_position_ok : BOOL;
    motor3_position_ok : BOOL;
    motor4_position_ok : BOOL;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#5ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#10ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : PLC_STEP_PULSE_CTR;
    PROGRAM instance1 WITH task1 : main;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "e895d4a455fa9691841c253cdc2347b9";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern __IEC_BYTE_t CONFIG0__SERIALRCV;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__ZERO_M1_KAKI_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__ZERO_M2_KAKI_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__ZERO_M3_KAKI_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__ZERO_M4_KAKI_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__PRINTMSG;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR1_1;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR2_1;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR3_1;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR4_1;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR1_2;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR2_2;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR3_2;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR4_2;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR1_3;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR2_3;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR3_3;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__POSITION_MOTOR4_3;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CW_M1;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CW_M2;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CW_M3;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CW_M4;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CCW_M1;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CCW_M2;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CCW_M3;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__CCW_M4;*)
(*DBG:extern __IEC_BYTE_t CONFIG0__DATA_MOTO1;*)
(*DBG:extern __IEC_BYTE_t CONFIG0__DATA_MOTO2;*)
(*DBG:extern __IEC_BYTE_t CONFIG0__DATA_MOTO3;*)
(*DBG:extern __IEC_BYTE_t CONFIG0__DATA_MOTO4;*)
(*DBG:extern __IEC_STRING_t CONFIG0__SERIALMSG;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__CURRENT_MOTOR_1_POSITION;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__CURRENT_MOTOR_2_POSITION;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__CURRENT_MOTOR_3_POSITION;*)
(*DBG:extern __IEC_DWORD_t CONFIG0__CURRENT_MOTOR_4_POSITION;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR1_SPEED;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR2_SPEED;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR3_SPEED;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR4_SPEED;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR1_ACCEL;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR2_ACCEL;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR3_ACCEL;*)
(*DBG:extern __IEC_UINT_t CONFIG0__MOTOR4_ACCEL;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__START_MOTO_1;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__START_MOTO_2;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__START_MOTO_3;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__START_MOTO_4;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR1_RUNNING;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR2_RUNNING;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR3_RUNNING;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR4_RUNNING;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR1_POSITION_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR2_POSITION_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR3_POSITION_OK;*)
(*DBG:extern __IEC_BOOL_t CONFIG0__MOTOR4_POSITION_OK;*)
(*DBG:extern PLC_STEP_PULSE_CTR RES0__INSTANCE0;*)
(*DBG:extern MAIN RES0__INSTANCE1;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(CONFIG0__SERIALRCV), BYTE_ENUM},*)
(*DBG:    {&(CONFIG0__ZERO_M1_KAKI_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__ZERO_M2_KAKI_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__ZERO_M3_KAKI_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__ZERO_M4_KAKI_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__PRINTMSG), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR1_1), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR2_1), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR3_1), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR4_1), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR1_2), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR2_2), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR3_2), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR4_2), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR1_3), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR2_3), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR3_3), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__POSITION_MOTOR4_3), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__CW_M1), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CW_M2), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CW_M3), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CW_M4), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CCW_M1), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CCW_M2), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CCW_M3), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__CCW_M4), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__DATA_MOTO1), BYTE_ENUM},*)
(*DBG:    {&(CONFIG0__DATA_MOTO2), BYTE_ENUM},*)
(*DBG:    {&(CONFIG0__DATA_MOTO3), BYTE_ENUM},*)
(*DBG:    {&(CONFIG0__DATA_MOTO4), BYTE_ENUM},*)
(*DBG:    {&(CONFIG0__SERIALMSG), STRING_ENUM},*)
(*DBG:    {&(CONFIG0__CURRENT_MOTOR_1_POSITION), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__CURRENT_MOTOR_2_POSITION), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__CURRENT_MOTOR_3_POSITION), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__CURRENT_MOTOR_4_POSITION), DWORD_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR1_SPEED), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR2_SPEED), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR3_SPEED), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR4_SPEED), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR1_ACCEL), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR2_ACCEL), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR3_ACCEL), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR4_ACCEL), UINT_ENUM},*)
(*DBG:    {&(CONFIG0__START_MOTO_1), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__START_MOTO_2), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__START_MOTO_3), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__START_MOTO_4), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR1_RUNNING), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR2_RUNNING), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR3_RUNNING), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR4_RUNNING), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR1_POSITION_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR2_POSITION_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR3_POSITION_OK), BOOL_ENUM},*)
(*DBG:    {&(CONFIG0__MOTOR4_POSITION_OK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR1_1), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR2_1), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR3_1), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR4_1), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR1_2), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR2_2), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR3_2), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR4_2), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR1_3), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR2_3), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR3_3), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.POSITION_MOTOR4_3), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STEP_1), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STEP_2), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STEP_3), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.STEP_4), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.EN_MOTOR1), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.EN_MOTOR2), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.EN_MOTOR3), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.EN_MOTOR4), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M1), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M2), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M3), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M4), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M1), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M2), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M3), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M4), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M1_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M2_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M3_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CCW_M4_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M1_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M2_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M3_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CW_M4_ON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.DATA_MOTO1), BYTE_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.DATA_MOTO2), BYTE_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.DATA_MOTO3), BYTE_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.DATA_MOTO4), BYTE_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_MOTOR_1_POSITION), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_MOTOR_2_POSITION), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_MOTOR_3_POSITION), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_MOTOR_4_POSITION), DWORD_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_1_VITRI), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_2_VITRI), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_3_VITRI), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CURRENT_4_VITRI), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_SPEED), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_SPEED), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_SPEED), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_SPEED), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR1_SPEED), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR2_SPEED), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR3_SPEED), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR4_SPEED), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR1_ACCEL), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR2_ACCEL), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR3_ACCEL), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SET_MOTOR4_ACCEL), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_ACCEL), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_ACCEL), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_ACCEL), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_ACCEL), UINT_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODE_RUN_M1), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODE_RUN_M2), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODE_RUN_M3), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MODE_RUN_M4), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.START_MOTO_1), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.START_MOTO_2), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.START_MOTO_3), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.START_MOTO_4), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_RUNNING), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_RUNNING), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_RUNNING), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_RUNNING), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_POSITION_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_POSITION_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_POSITION_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_POSITION_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_RUNING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_RUNING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_RUNING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_RUNING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR1_POS_OK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR2_POS_OK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR3_POS_OK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MOTOR4_POS_OK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.ZERO_M1_KAKI_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.ZERO_M2_KAKI_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.ZERO_M3_KAKI_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.ZERO_M4_KAKI_OK), BOOL_P_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE15_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE15_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE12_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE12_OUT), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE16_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE16_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE14_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE14_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE21_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE21_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE10_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE10_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE25_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE25_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE24_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE24_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE13_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE13_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE34_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE34_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE30_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE30_OUT), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE36_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE36_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE38_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE38_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE40_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE40_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE57_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE57_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE56_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE56_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE66_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE66_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE63_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE63_OUT), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE68_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE68_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE70_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE70_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE72_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE72_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE81_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE81_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE80_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE80_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE90_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE90_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE87_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE87_OUT), BYTE_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE92_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE92_OUT), DWORD_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE94_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE94_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE96_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE96_OUT), UINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TOF0.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.PT), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.ET), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.STATE), SINT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.PREV_IN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.CURRENT_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.TON0.START_TIME), TIME_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED0), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED1), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED2), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED3), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED4), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED5), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED6), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED7), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A0), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A1), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A2), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A3), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A0_VALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A1_VALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A2_VALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.ANALOG_A3_VALUE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON0), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON1), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON2), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON3), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON_TEM0), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON_TEM1), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON_TEM2), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BUTTON_TEM3), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED8), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED9), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED10), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1.BLINK_LED11), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1._TMP_MOVE15_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1._TMP_MOVE2_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1._TMP_MOVE14_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE1._TMP_MOVE19_OUT), INT_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               255*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case STRING_ENUM:*)
(*DBG:        return sizeof(STRING);*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return sizeof(TIME);*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return sizeof(SINT);*)
(*DBG:    case UINT_ENUM:*)
(*DBG:    case UINT_P_ENUM:*)
(*DBG:        return sizeof(UINT);*)
(*DBG:    case BYTE_ENUM:*)
(*DBG:    case BYTE_P_ENUM:*)
(*DBG:        return sizeof(BYTE);*)
(*DBG:    case DWORD_ENUM:*)
(*DBG:    case DWORD_P_ENUM:*)
(*DBG:        return sizeof(DWORD);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case STRING_ENUM:*)
(*DBG:        return (void *)&((__IEC_STRING_t *) ptr)->value;*)
(*DBG:    case TIME_ENUM:*)
(*DBG:        return (void *)&((__IEC_TIME_t *) ptr)->value;*)
(*DBG:    case SINT_ENUM:*)
(*DBG:        return (void *)&((__IEC_SINT_t *) ptr)->value;*)
(*DBG:    case UINT_ENUM:*)
(*DBG:        return (void *)&((__IEC_UINT_t *) ptr)->value;*)
(*DBG:    case UINT_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_UINT_p *) ptr)->flags & __IEC_FORCE_FLAG) *)
(*DBG:                        ? &(((__IEC_UINT_p *) ptr)->fvalue) *)
(*DBG:                        : ((__IEC_UINT_p *) ptr)->value);*)
(*DBG:    case BYTE_ENUM:*)
(*DBG:        return (void *)&((__IEC_BYTE_t *) ptr)->value;*)
(*DBG:    case BYTE_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_BYTE_p *) ptr)->flags & __IEC_FORCE_FLAG) *)
(*DBG:                        ? &(((__IEC_BYTE_p *) ptr)->fvalue) *)
(*DBG:                        : ((__IEC_BYTE_p *) ptr)->value);*)
(*DBG:    case DWORD_ENUM:*)
(*DBG:        return (void *)&((__IEC_DWORD_t *) ptr)->value;*)
(*DBG:    case DWORD_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_DWORD_p *) ptr)->flags & __IEC_FORCE_FLAG) *)
(*DBG:                        ? &(((__IEC_DWORD_p *) ptr)->fvalue) *)
(*DBG:                        : ((__IEC_DWORD_p *) ptr)->value);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    case BOOL_P_ENUM:*)
(*DBG:        return (void *)((((__IEC_BOOL_p *) ptr)->flags & __IEC_FORCE_FLAG) *)
(*DBG:                        ? &(((__IEC_BOOL_p *) ptr)->fvalue) *)
(*DBG:                        : ((__IEC_BOOL_p *) ptr)->value);*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case STRING_ENUM: {*)
(*DBG:            memcpy(&((__IEC_STRING_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_STRING_t *) ptr)->value = *((STRING *) val);*)
(*DBG:            ((__IEC_STRING_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case TIME_ENUM: {*)
(*DBG:            memcpy(&((__IEC_TIME_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_TIME_t *) ptr)->value = *((TIME *) val);*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case SINT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_SINT_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_SINT_t *) ptr)->value = *((SINT *) val);*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case UINT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_UINT_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_UINT_t *) ptr)->value = *((UINT *) val);*)
(*DBG:            ((__IEC_UINT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case UINT_P_ENUM: {*)
(*DBG:            memcpy(&((__IEC_UINT_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            //((__IEC_UINT_p *) ptr)->fvalue = *((UINT *) val);*)
(*DBG:            ((__IEC_UINT_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BYTE_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BYTE_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_BYTE_t *) ptr)->value = *((BYTE *) val);*)
(*DBG:            ((__IEC_BYTE_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BYTE_P_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BYTE_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            //((__IEC_BYTE_p *) ptr)->fvalue = *((BYTE *) val);*)
(*DBG:            ((__IEC_BYTE_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case DWORD_ENUM: {*)
(*DBG:            memcpy(&((__IEC_DWORD_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_DWORD_t *) ptr)->value = *((DWORD *) val);*)
(*DBG:            ((__IEC_DWORD_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case DWORD_P_ENUM: {*)
(*DBG:            memcpy(&((__IEC_DWORD_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            //((__IEC_DWORD_p *) ptr)->fvalue = *((DWORD *) val);*)
(*DBG:            ((__IEC_DWORD_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_BOOL_t *) ptr)->value = *((BOOL *) val);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BOOL_P_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_p *) ptr)->fvalue, val, var_size);*)
(*DBG:            //((__IEC_BOOL_p *) ptr)->fvalue = *((BOOL *) val);*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_INT_t *) ptr)->value = *((INT *) val);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case STRING_ENUM:*)
(*DBG:            ((__IEC_STRING_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case TIME_ENUM:*)
(*DBG:            ((__IEC_TIME_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case SINT_ENUM:*)
(*DBG:            ((__IEC_SINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case UINT_ENUM:*)
(*DBG:            ((__IEC_UINT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case UINT_P_ENUM:*)
(*DBG:            ((__IEC_UINT_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BYTE_ENUM:*)
(*DBG:            ((__IEC_BYTE_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BYTE_P_ENUM:*)
(*DBG:            ((__IEC_BYTE_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case DWORD_ENUM:*)
(*DBG:            ((__IEC_DWORD_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case DWORD_P_ENUM:*)
(*DBG:            ((__IEC_DWORD_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_P_ENUM:*)
(*DBG:            ((__IEC_BOOL_p *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size) *)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i) *)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++) *)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT) *)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Aaaaarghhhh... Stupid AVR is Big Endian.*)
(*DBG:            swap_bytes(val, get_var_size(idx));*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)