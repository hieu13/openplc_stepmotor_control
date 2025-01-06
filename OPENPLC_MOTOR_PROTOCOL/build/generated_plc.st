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
END_PROGRAM

PROGRAM kiban_hanso
  VAR
    ita_hanso_start : BOOL;
    ita_hanso_il : BOOL;
    ita_hanso_running : BOOL;
    ita_hanso_B0 : BOOL;
    ita_hanso_B1 : BOOL;
    ita_hanso_B2 : BOOL;
    ita_hanso_B3 : BOOL;
  END_VAR
  VAR
    Sensor_fiber1 AT %IX0.0 : BOOL;
    Sensor_fiber2 AT %IX0.1 : BOOL;
    Sensor_metal AT %IX0.2 : BOOL;
  END_VAR
  VAR
    ita_kakunin_ok : BOOL;
    TON0 : TON;
    TON1 : TON;
    kiban_nai_ERR : BOOL;
  END_VAR
  VAR_EXTERNAL
    position_motor1_1 : DWORD;
    position_motor2_1 : DWORD;
  END_VAR
  VAR
    idou_pos_hansou AT %MD0 : DWORD := 30000;
    idou_pos_pickup AT %MD1 : DWORD := 30000;
  END_VAR
  VAR
    en_motor1 : BOOL;
  END_VAR
  VAR_EXTERNAL
    cw_m1 : BOOL;
    ccw_m1 : BOOL;
  END_VAR
  VAR
    ccw_m1_on : BOOL;
    cw_m1_on : BOOL;
  END_VAR
  VAR_EXTERNAL
    data_moto1 : BYTE;
    data_moto2 : BYTE;
    current_M1_pos : DWORD;
    current_M2_pos : DWORD;
  END_VAR
  VAR
    current_1_vitri : DWORD;
  END_VAR
  VAR_EXTERNAL
    motor1_speed : UINT;
    motor2_speed : UINT;
  END_VAR
  VAR
    set_motor1_speed : UINT;
    set_motor1_accel : UINT;
  END_VAR
  VAR_EXTERNAL
    motor1_accel : UINT;
    motor2_accel : UINT;
  END_VAR
  VAR
    mode_run_m1 : BYTE;
  END_VAR
  VAR_EXTERNAL
    START_Moto_1 : BOOL;
    START_Moto_2 : BOOL;
    motor1_running : BOOL;
    motor1_position_ok : BOOL;
    motor2_position_ok : BOOL;
    zero_m1_kaki_ok : BOOL;
    lr_0 : BOOL;
    lr_1 : BOOL;
    lr_2 : BOOL;
    lr_3 : BOOL;
    dm_0 : DWORD;
    dm_1 : DWORD;
    dm_2 : DWORD;
    dm_3 : DWORD;
    dm_4 : DWORD;
  END_VAR
  VAR
    dm_input0 : DWORD;
    dm_input1 : DWORD;
    dm_input2 : DWORD;
    dm_input3 : DWORD;
    dm_input4 : DWORD;
    kb_hansou_idouOK : BOOL;
    pickup_idouOK : BOOL;
    pickup_siji : BOOL;
    save0 : BOOL;
    save1 : BOOL;
    save2 : BOOL;
    save3 : BOOL;
    save4 : BOOL;
    _TMP_MOVE39_ENO : BOOL;
    _TMP_MOVE39_OUT : DWORD;
    _TMP_MOVE41_ENO : BOOL;
    _TMP_MOVE41_OUT : UINT;
    _TMP_MOVE51_ENO : BOOL;
    _TMP_MOVE51_OUT : UINT;
    _TMP_MOVE59_ENO : BOOL;
    _TMP_MOVE59_OUT : BYTE;
    _TMP_EQ67_ENO : BOOL;
    _TMP_EQ67_OUT : BOOL;
    _TMP_MOVE25_ENO : BOOL;
    _TMP_MOVE25_OUT : DWORD;
    _TMP_MOVE29_ENO : BOOL;
    _TMP_MOVE29_OUT : UINT;
    _TMP_MOVE32_ENO : BOOL;
    _TMP_MOVE32_OUT : UINT;
    _TMP_MOVE35_ENO : BOOL;
    _TMP_MOVE35_OUT : BYTE;
    _TMP_EQ43_ENO : BOOL;
    _TMP_EQ43_OUT : BOOL;
    _TMP_MOVE72_ENO : BOOL;
    _TMP_MOVE72_OUT : DWORD;
    _TMP_MOVE62_ENO : BOOL;
    _TMP_MOVE62_OUT : DWORD;
    _TMP_MOVE80_ENO : BOOL;
    _TMP_MOVE80_OUT : DWORD;
    _TMP_MOVE86_ENO : BOOL;
    _TMP_MOVE86_OUT : DWORD;
    _TMP_MOVE92_ENO : BOOL;
    _TMP_MOVE92_OUT : DWORD;
  END_VAR

  IF NOT(ita_hanso_il) AND ita_hanso_start THEN
    ita_hanso_running := TRUE; (*set*)
  END_IF;
  IF NOT(ita_hanso_il) AND ita_hanso_start THEN
    ita_hanso_B0 := TRUE; (*set*)
  END_IF;
  IF NOT(ita_hanso_il) AND ita_hanso_start THEN
    ita_hanso_il := TRUE; (*set*)
  END_IF;
  TON0(IN := Sensor_fiber1 AND ita_hanso_B0 AND ita_hanso_running AND ita_hanso_start, PT := T#100ms);
  ita_kakunin_ok := TON0.Q;
  TON1(IN := NOT(Sensor_fiber1) AND ita_hanso_B0 AND ita_hanso_running AND ita_hanso_start, PT := T#5000ms);
  kiban_nai_ERR := TON1.Q;
  IF TON0.Q THEN
    ita_hanso_B1 := TRUE; (*set*)
  END_IF;
  IF TON0.Q THEN
    ita_hanso_B0 := FALSE; (*reset*)
  END_IF;
  IF TON1.Q THEN
    ita_hanso_start := FALSE; (*reset*)
  END_IF;
  _TMP_MOVE39_OUT := MOVE(EN := ita_hanso_B1, IN := dm_0, ENO => _TMP_MOVE39_ENO);
  START_Moto_1 := _TMP_MOVE39_ENO;
  IF _TMP_MOVE39_ENO THEN
      position_motor1_1 := _TMP_MOVE39_OUT;
  END_IF;
  _TMP_MOVE41_OUT := MOVE(EN := ita_hanso_B1, IN := 5000, ENO => _TMP_MOVE41_ENO);
  IF _TMP_MOVE41_ENO THEN
      motor1_speed := _TMP_MOVE41_OUT;
  END_IF;
  _TMP_MOVE51_OUT := MOVE(EN := ita_hanso_B1, IN := 2000, ENO => _TMP_MOVE51_ENO);
  IF _TMP_MOVE51_ENO THEN
      motor1_accel := _TMP_MOVE51_OUT;
  END_IF;
  _TMP_MOVE59_OUT := MOVE(EN := ita_hanso_B1, IN := 8, ENO => _TMP_MOVE59_ENO);
  IF _TMP_MOVE59_ENO THEN
      data_moto1 := _TMP_MOVE59_OUT;
  END_IF;
  _TMP_EQ67_OUT := EQ(EN := ita_hanso_B1, IN1 := dm_0, IN2 := current_M1_pos, ENO => _TMP_EQ67_ENO);
  IF motor1_position_ok AND _TMP_EQ67_OUT THEN
    ita_hanso_B1 := FALSE; (*reset*)
  END_IF;
  IF motor1_position_ok AND _TMP_EQ67_OUT THEN
    kb_hansou_idouOK := TRUE; (*set*)
  END_IF;
  _TMP_MOVE25_OUT := MOVE(EN := pickup_siji, IN := dm_1, ENO => _TMP_MOVE25_ENO);
  START_Moto_2 := _TMP_MOVE25_ENO;
  IF _TMP_MOVE25_ENO THEN
      position_motor2_1 := _TMP_MOVE25_OUT;
  END_IF;
  _TMP_MOVE29_OUT := MOVE(EN := pickup_siji, IN := 5000, ENO => _TMP_MOVE29_ENO);
  IF _TMP_MOVE29_ENO THEN
      motor2_speed := _TMP_MOVE29_OUT;
  END_IF;
  _TMP_MOVE32_OUT := MOVE(EN := pickup_siji, IN := 2000, ENO => _TMP_MOVE32_ENO);
  IF _TMP_MOVE32_ENO THEN
      motor2_accel := _TMP_MOVE32_OUT;
  END_IF;
  _TMP_MOVE35_OUT := MOVE(EN := pickup_siji, IN := 8, ENO => _TMP_MOVE35_ENO);
  IF _TMP_MOVE35_ENO THEN
      data_moto2 := _TMP_MOVE35_OUT;
  END_IF;
  _TMP_EQ43_OUT := EQ(EN := pickup_siji, IN1 := dm_1, IN2 := current_M2_pos, ENO => _TMP_EQ43_ENO);
  IF motor2_position_ok AND _TMP_EQ43_OUT THEN
    pickup_siji := FALSE; (*reset*)
  END_IF;
  IF motor2_position_ok AND _TMP_EQ43_OUT THEN
    pickup_idouOK := TRUE; (*set*)
  END_IF;
  _TMP_MOVE72_OUT := MOVE(EN := save0, IN := dm_input0, ENO => _TMP_MOVE72_ENO);
  IF _TMP_MOVE72_ENO THEN
      dm_0 := _TMP_MOVE72_OUT;
  END_IF;
  _TMP_MOVE62_OUT := MOVE(EN := save1, IN := dm_input1, ENO => _TMP_MOVE62_ENO);
  IF _TMP_MOVE62_ENO THEN
      dm_1 := _TMP_MOVE62_OUT;
  END_IF;
  _TMP_MOVE80_OUT := MOVE(EN := save2, IN := dm_input2, ENO => _TMP_MOVE80_ENO);
  IF _TMP_MOVE80_ENO THEN
      dm_2 := _TMP_MOVE80_OUT;
  END_IF;
  _TMP_MOVE86_OUT := MOVE(EN := save3, IN := dm_input3, ENO => _TMP_MOVE86_ENO);
  IF _TMP_MOVE86_ENO THEN
      dm_3 := _TMP_MOVE86_OUT;
  END_IF;
  _TMP_MOVE92_OUT := MOVE(EN := save4, IN := dm_input4, ENO => _TMP_MOVE92_ENO);
  IF _TMP_MOVE92_ENO THEN
      dm_4 := _TMP_MOVE92_OUT;
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
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#5ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#10ms,PRIORITY := 0);
    PROGRAM instance1 WITH task0 : main;
    PROGRAM instance2 WITH task1 : kiban_hanso;
  END_RESOURCE
END_CONFIGURATION
