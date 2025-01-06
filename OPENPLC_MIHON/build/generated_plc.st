PROGRAM PLC_STEP_PULSE_CTR
  VAR_EXTERNAL
    position_motor1_1 : DWORD;
    position_motor2_1 : DWORD;
    position_motor3_1 : DWORD;
    position_motor4_1 : DWORD;
    position_motor5_1 : DWORD;
    position_motor6_1 : DWORD;
    position_motor7_1 : DWORD;
    position_motor8_1 : DWORD;
  END_VAR
  VAR
    step_1 : DWORD;
    step_2 : DWORD;
    step_3 : DWORD;
    step_4 : DWORD;
    step_5 : DWORD;
    step_6 : DWORD;
    step_7 : DWORD;
    step_8 : DWORD;
    en_motor1 : BOOL;
    en_motor2 : BOOL;
    en_motor3 : BOOL;
    en_motor4 : BOOL;
    en_motor5 : BOOL;
    en_motor6 : BOOL;
    en_motor7 : BOOL;
    en_motor8 : BOOL;
  END_VAR
  VAR_EXTERNAL
    cw_m1 : BOOL;
    cw_m2 : BOOL;
    cw_m3 : BOOL;
    cw_m4 : BOOL;
    cw_m5 : BOOL;
    cw_m6 : BOOL;
    cw_m7 : BOOL;
    cw_m8 : BOOL;
    ccw_m1 : BOOL;
    ccw_m2 : BOOL;
    ccw_m3 : BOOL;
    ccw_m4 : BOOL;
    ccw_m5 : BOOL;
    ccw_m6 : BOOL;
    ccw_m7 : BOOL;
    ccw_m8 : BOOL;
  END_VAR
  VAR
    ccw_m1_on : BOOL;
    ccw_m2_on : BOOL;
    ccw_m3_on : BOOL;
    ccw_m4_on : BOOL;
    ccw_m5_on : BOOL;
    ccw_m6_on : BOOL;
    ccw_m7_on : BOOL;
    ccw_m8_on : BOOL;
    cw_m1_on : BOOL;
    cw_m2_on : BOOL;
    cw_m3_on : BOOL;
    cw_m4_on : BOOL;
    cw_m5_on : BOOL;
    cw_m6_on : BOOL;
    cw_m7_on : BOOL;
    cw_m8_on : BOOL;
  END_VAR
  VAR_EXTERNAL
    data_moto1 : BYTE;
    data_moto2 : BYTE;
    data_moto3 : BYTE;
    data_moto4 : BYTE;
    data_moto5 : BYTE;
    data_moto6 : BYTE;
    data_moto7 : BYTE;
    data_moto8 : BYTE;
    current_M1_pos : DWORD;
    current_M2_pos : DWORD;
    current_M3_pos : DWORD;
    current_M4_pos : DWORD;
    current_M5_pos : DWORD;
    current_M6_pos : DWORD;
    current_M7_pos : DWORD;
    current_M8_pos : DWORD;
  END_VAR
  VAR
    current_1_vitri : DWORD;
    current_2_vitri : DWORD;
    current_3_vitri : DWORD;
    current_4_vitri : DWORD;
    current_5_vitri : DWORD;
    current_6_vitri : DWORD;
    current_7_vitri : DWORD;
    current_8_vitri : DWORD;
  END_VAR
  VAR_EXTERNAL
    motor1_speed : UINT;
    motor2_speed : UINT;
    motor3_speed : UINT;
    motor4_speed : UINT;
    motor5_speed : UINT;
    motor6_speed : UINT;
    motor7_speed : UINT;
    motor8_speed : UINT;
  END_VAR
  VAR
    set_motor1_speed : UINT := 8000;
    set_motor2_speed : UINT := 8000;
    set_motor3_speed : UINT := 8000;
    set_motor4_speed : UINT := 8000;
    set_motor5_speed : UINT := 8000;
    set_motor6_speed : UINT := 8000;
    set_motor7_speed : UINT := 8000;
    set_motor8_speed : UINT := 8000;
    set_motor1_accel : UINT := 2000;
    set_motor2_accel : UINT := 2000;
    set_motor3_accel : UINT := 2000;
    set_motor4_accel : UINT := 2000;
    set_motor5_accel : UINT := 2000;
    set_motor6_accel : UINT := 2000;
    set_motor7_accel : UINT := 2000;
    set_motor8_accel : UINT := 2000;
  END_VAR
  VAR_EXTERNAL
    motor1_accel : UINT;
    motor2_accel : UINT;
    motor3_accel : UINT;
    motor4_accel : UINT;
    motor5_accel : UINT;
    motor6_accel : UINT;
    motor7_accel : UINT;
    motor8_accel : UINT;
  END_VAR
  VAR
    mode_run_m1 : BYTE;
    mode_run_m2 : BYTE;
    mode_run_m3 : BYTE;
    mode_run_m4 : BYTE;
    mode_run_m5 : BYTE;
    mode_run_m6 : BYTE;
    mode_run_m7 : BYTE;
    mode_run_m8 : BYTE;
  END_VAR
  VAR_EXTERNAL
    START_Moto_1 : BOOL;
    START_Moto_2 : BOOL;
    START_Moto_3 : BOOL;
    START_Moto_4 : BOOL;
    START_Moto_5 : BOOL;
    START_Moto_6 : BOOL;
    START_Moto_7 : BOOL;
    START_Moto_8 : BOOL;
    motor1_running : BOOL;
    motor2_running : BOOL;
    motor3_running : BOOL;
    motor4_running : BOOL;
    motor5_running : BOOL;
    motor6_running : BOOL;
    motor7_running : BOOL;
    motor8_running : BOOL;
    motor1_position_ok : BOOL;
    motor2_position_ok : BOOL;
    motor3_position_ok : BOOL;
    motor4_position_ok : BOOL;
    motor5_position_ok : BOOL;
    motor6_position_ok : BOOL;
    motor7_position_ok : BOOL;
    motor8_position_ok : BOOL;
  END_VAR
  VAR
    MOTOR1_RUNING : BOOL;
    MOTOR2_RUNING : BOOL;
    MOTOR3_RUNING : BOOL;
    MOTOR4_RUNING : BOOL;
    MOTOR5_RUNING : BOOL;
    MOTOR6_RUNING : BOOL;
    MOTOR7_RUNING : BOOL;
    MOTOR8_RUNING : BOOL;
    MOTOR1_POS_ok : BOOL;
    MOTOR2_POS_ok : BOOL;
    MOTOR3_POS_ok : BOOL;
    MOTOR4_POS_ok : BOOL;
    MOTOR5_POS_ok : BOOL;
    MOTOR6_POS_ok : BOOL;
    MOTOR7_POS_ok : BOOL;
    MOTOR8_POS_ok : BOOL;
  END_VAR
  VAR_EXTERNAL
    zero_m1_kaki_ok : BOOL;
    zero_m2_kaki_ok : BOOL;
    zero_m3_kaki_ok : BOOL;
    zero_m4_kaki_ok : BOOL;
    zero_m5_kaki_ok : BOOL;
    zero_m6_kaki_ok : BOOL;
    zero_m7_kaki_ok : BOOL;
    zero_m8_kaki_ok : BOOL;
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
  _TMP_MOVE16_OUT := MOVE(EN := TRUE, IN := current_M1_pos, ENO => _TMP_MOVE16_ENO);
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
  _TMP_MOVE36_OUT := MOVE(EN := TRUE, IN := current_M2_pos, ENO => _TMP_MOVE36_ENO);
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
  _TMP_MOVE68_OUT := MOVE(EN := TRUE, IN := current_M3_pos, ENO => _TMP_MOVE68_ENO);
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
  _TMP_MOVE92_OUT := MOVE(EN := TRUE, IN := current_M4_pos, ENO => _TMP_MOVE92_ENO);
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
    blink_led2 AT %QX6.3 : BOOL;
  END_VAR
  VAR
    blink_led3 : BOOL;
  END_VAR
  VAR
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
  VAR_OUTPUT
    temp_coil : BOOL;
    temp_coil0 : BOOL;
  END_VAR
  VAR_INPUT
    temp_BT : BOOL;
    temp_BT0 : BOOL;
  END_VAR
  VAR_EXTERNAL
    lr_0 : BOOL;
    lr_1 : BOOL;
    lr_2 : BOOL;
    lr_3 : BOOL;
    lr_4 : BOOL;
    lr_5 : BOOL;
    lr_6 : BOOL;
    lr_7 : BOOL;
    lr_8 : BOOL;
    lr_9 : BOOL;
    lr_10 : BOOL;
    lr_11 : BOOL;
    lr_12 : BOOL;
    lr_13 : BOOL;
    lr_14 : BOOL;
    lr_15 : BOOL;
    dm_0 : DWORD;
    dm_1 : DWORD;
    dm_2 : DWORD;
    dm_3 : DWORD;
    dm_4 : DWORD;
    dm_5 : DWORD;
    dm_6 : DWORD;
    dm_7 : DWORD;
    dm_8 : DWORD;
    dm_9 : DWORD;
    dm_10 : DWORD;
    dm_11 : DWORD;
    dm_12 : DWORD;
    dm_13 : DWORD;
    dm_14 : DWORD;
    dm_15 : DWORD;
    dm_16 : DWORD;
    dm_17 : DWORD;
    dm_18 : DWORD;
    dm_19 : DWORD;
  END_VAR
  VAR
    temp_1 : DWORD;
    temp_2 : DWORD;
    temp_3 : DWORD;
    temp_4 : DWORD;
    temp_5 : DWORD;
    temp_6 : DWORD;
    temp_7 : DWORD;
    test : BOOL;
    test0 : DWORD;
    test1 : DWORD;
    test2 : DWORD;
    test3 : DWORD;
    test4 : DWORD;
    test5 : DWORD;
    test6 : DWORD;
    test7 : DWORD;
    coil_lr : BOOL;
    coil_lr0 : BOOL;
    coil_lr1 : BOOL;
    coil_lr2 : BOOL;
    coil_lr3 : BOOL;
  END_VAR
  VAR_EXTERNAL
    coil_256 : UINT;
  END_VAR
  VAR
    coil_257 : UINT;
    _TMP_MOVE15_OUT : INT;
    _TMP_MOVE2_OUT : INT;
    _TMP_MOVE14_OUT : INT;
    _TMP_MOVE19_OUT : INT;
    _TMP_MOVE57_OUT : DWORD;
    _TMP_MOVE60_OUT : DWORD;
    _TMP_MOVE63_OUT : DWORD;
    _TMP_MOVE66_OUT : DWORD;
    _TMP_MOVE68_ENO : BOOL;
    _TMP_MOVE68_OUT : DWORD;
    _TMP_MOVE74_ENO : BOOL;
    _TMP_MOVE74_OUT : DWORD;
    _TMP_MOVE75_ENO : BOOL;
    _TMP_MOVE75_OUT : DWORD;
    _TMP_MOVE78_ENO : BOOL;
    _TMP_MOVE78_OUT : DWORD;
    _TMP_MOVE81_ENO : BOOL;
    _TMP_MOVE81_OUT : DWORD;
    _TMP_MOVE86_ENO : BOOL;
    _TMP_MOVE86_OUT : DWORD;
    _TMP_MOVE89_ENO : BOOL;
    _TMP_MOVE89_OUT : DWORD;
    _TMP_MOVE93_OUT : DWORD;
    _TMP_MOVE96_OUT : DWORD;
    _TMP_MOVE99_OUT : DWORD;
    _TMP_MOVE108_OUT : UINT;
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
  IF temp_BT THEN
    temp_coil := TRUE; (*set*)
  END_IF;
  IF temp_BT0 THEN
    temp_coil0 := TRUE; (*set*)
  END_IF;
  _TMP_MOVE57_OUT := MOVE(dm_0);
  temp_1 := _TMP_MOVE57_OUT;
  _TMP_MOVE60_OUT := MOVE(dm_1);
  temp_2 := _TMP_MOVE60_OUT;
  _TMP_MOVE63_OUT := MOVE(dm_2);
  temp_3 := _TMP_MOVE63_OUT;
  _TMP_MOVE66_OUT := MOVE(dm_5);
  temp_4 := _TMP_MOVE66_OUT;
  _TMP_MOVE68_OUT := MOVE(EN := test, IN := test0, ENO => _TMP_MOVE68_ENO);
  IF _TMP_MOVE68_ENO THEN
      dm_0 := _TMP_MOVE68_OUT;
  END_IF;
  _TMP_MOVE74_OUT := MOVE(EN := test, IN := test1, ENO => _TMP_MOVE74_ENO);
  IF _TMP_MOVE74_ENO THEN
      dm_1 := _TMP_MOVE74_OUT;
  END_IF;
  _TMP_MOVE75_OUT := MOVE(EN := test, IN := test2, ENO => _TMP_MOVE75_ENO);
  IF _TMP_MOVE75_ENO THEN
      dm_2 := _TMP_MOVE75_OUT;
  END_IF;
  _TMP_MOVE78_OUT := MOVE(EN := test, IN := test3, ENO => _TMP_MOVE78_ENO);
  IF _TMP_MOVE78_ENO THEN
      dm_5 := _TMP_MOVE78_OUT;
  END_IF;
  _TMP_MOVE81_OUT := MOVE(EN := test, IN := test4, ENO => _TMP_MOVE81_ENO);
  IF _TMP_MOVE81_ENO THEN
      dm_10 := _TMP_MOVE81_OUT;
  END_IF;
  _TMP_MOVE86_OUT := MOVE(EN := test, IN := test5, ENO => _TMP_MOVE86_ENO);
  IF _TMP_MOVE86_ENO THEN
      dm_15 := _TMP_MOVE86_OUT;
  END_IF;
  _TMP_MOVE89_OUT := MOVE(EN := test, IN := test6, ENO => _TMP_MOVE89_ENO);
  IF _TMP_MOVE89_ENO THEN
      dm_19 := _TMP_MOVE89_OUT;
  END_IF;
  _TMP_MOVE93_OUT := MOVE(dm_10);
  temp_5 := _TMP_MOVE93_OUT;
  _TMP_MOVE96_OUT := MOVE(dm_15);
  temp_6 := _TMP_MOVE96_OUT;
  _TMP_MOVE99_OUT := MOVE(dm_19);
  temp_7 := _TMP_MOVE99_OUT;
  IF coil_lr THEN
    lr_0 := TRUE; (*set*)
  END_IF;
  IF coil_lr0 THEN
    lr_1 := TRUE; (*set*)
  END_IF;
  coil_lr3 := lr_7;
  _TMP_MOVE108_OUT := MOVE(coil_256);
  coil_257 := _TMP_MOVE108_OUT;
  IF coil_lr1 THEN
    lr_7 := FALSE; (*reset*)
  END_IF;
  IF coil_lr2 THEN
    lr_7 := TRUE; (*set*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0
  VAR_GLOBAL
    zero_m1_kaki_ok : BOOL;
    zero_m2_kaki_ok : BOOL;
    zero_m3_kaki_ok : BOOL;
    zero_m4_kaki_ok : BOOL;
    zero_m5_kaki_ok : BOOL;
    zero_m6_kaki_ok : BOOL;
    zero_m7_kaki_ok : BOOL;
    zero_m8_kaki_ok : BOOL;
    position_motor1_1 : DWORD;
    position_motor2_1 : DWORD;
    position_motor3_1 : DWORD;
    position_motor4_1 : DWORD;
    position_motor5_1 : DWORD;
    position_motor6_1 : DWORD;
    position_motor7_1 : DWORD;
    position_motor8_1 : DWORD;
    cw_m1 : BOOL;
    cw_m2 : BOOL;
    cw_m3 : BOOL;
    cw_m4 : BOOL;
    cw_m5 : BOOL;
    cw_m6 : BOOL;
    cw_m7 : BOOL;
    cw_m8 : BOOL;
    ccw_m1 : BOOL;
    ccw_m2 : BOOL;
    ccw_m3 : BOOL;
    ccw_m4 : BOOL;
    ccw_m5 : BOOL;
    ccw_m6 : BOOL;
    ccw_m7 : BOOL;
    ccw_m8 : BOOL;
    data_moto1 : BYTE;
    data_moto2 : BYTE;
    data_moto3 : BYTE;
    data_moto4 : BYTE;
    data_moto5 : BYTE;
    data_moto6 : BYTE;
    data_moto7 : BYTE;
    data_moto8 : BYTE;
    current_M1_pos : DWORD;
    current_M2_pos : DWORD;
    current_M3_pos : DWORD;
    current_M4_pos : DWORD;
    current_M5_pos : DWORD;
    current_M6_pos : DWORD;
    current_M7_pos : DWORD;
    current_M8_pos : DWORD;
    motor1_speed : UINT;
    motor2_speed : UINT;
    motor3_speed : UINT;
    motor4_speed : UINT;
    motor5_speed : UINT;
    motor6_speed : UINT;
    motor7_speed : UINT;
    motor8_speed : UINT;
    motor1_accel : UINT;
    motor2_accel : UINT;
    motor3_accel : UINT;
    motor4_accel : UINT;
    motor5_accel : UINT;
    motor6_accel : UINT;
    motor7_accel : UINT;
    motor8_accel : UINT;
    START_Moto_1 : BOOL;
    START_Moto_2 : BOOL;
    START_Moto_3 : BOOL;
    START_Moto_4 : BOOL;
    START_Moto_5 : BOOL;
    START_Moto_6 : BOOL;
    START_Moto_7 : BOOL;
    START_Moto_8 : BOOL;
    motor1_running : BOOL;
    motor2_running : BOOL;
    motor3_running : BOOL;
    motor4_running : BOOL;
    motor5_running : BOOL;
    motor6_running : BOOL;
    motor7_running : BOOL;
    motor8_running : BOOL;
    motor1_position_ok : BOOL;
    motor2_position_ok : BOOL;
    motor3_position_ok : BOOL;
    motor4_position_ok : BOOL;
    motor5_position_ok : BOOL;
    motor6_position_ok : BOOL;
    motor7_position_ok : BOOL;
    motor8_position_ok : BOOL;
    lr_0 : BOOL;
    lr_1 : BOOL;
    lr_2 : BOOL;
    lr_3 : BOOL;
    lr_4 : BOOL;
    lr_5 : BOOL;
    lr_6 : BOOL;
    lr_7 : BOOL;
    lr_8 : BOOL;
    lr_9 : BOOL;
    lr_10 : BOOL;
    lr_11 : BOOL;
    lr_12 : BOOL;
    lr_13 : BOOL;
    lr_14 : BOOL;
    lr_15 : BOOL;
    dm_0 : DWORD;
    dm_1 : DWORD;
    dm_2 : DWORD;
    dm_3 : DWORD;
    dm_4 : DWORD;
    dm_5 : DWORD;
    dm_6 : DWORD;
    dm_7 : DWORD;
    dm_8 : DWORD;
    dm_9 : DWORD;
    dm_10 : DWORD;
    dm_11 : DWORD;
    dm_12 : DWORD;
    dm_13 : DWORD;
    dm_14 : DWORD;
    dm_15 : DWORD;
    dm_16 : DWORD;
    dm_17 : DWORD;
    dm_18 : DWORD;
    dm_19 : DWORD;
    coil_256 : UINT;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#5ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#10ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : PLC_STEP_PULSE_CTR;
    PROGRAM instance1 WITH task1 : main;
  END_RESOURCE
END_CONFIGURATION
