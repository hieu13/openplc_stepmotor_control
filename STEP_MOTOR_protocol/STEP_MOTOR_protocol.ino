//////////////////////////////// sketch section ////////////////////////////////
#include <AccelStepper.h>
//#include <MultiStepper.h>

#define INBUF_SIZE 64
static uint8_t inBuf[INBUF_SIZE];
static uint8_t checksum;
static uint8_t indRX;
static uint8_t cmdMSP;

//
#define MSP_COMMAND_1                   1
#define MSP_POSITION_M_1                10

#define MSP_COMMAND_2                   2
#define MSP_POSITION_M_2                11

#define MSP_COMMAND_3                   3
#define MSP_POSITION_M_3                12

#define MSP_COMMAND_4                   4
#define MSP_POSITION_M_4                13

#define MSP_COMMAND_5                   5
#define MSP_POSITION_M_5                14

#define MSP_COMMAND_6                   6
#define MSP_POSITION_M_6                15

#define MSP_COMMAND_7                   7
#define MSP_POSITION_M_7                16

#define MSP_COMMAND_8                   8
#define MSP_POSITION_M_8                17
//
#define MSP_COMMAND_1_FEEDBACK 50
#define MSP_COMMAND_2_FEEDBACK 51
#define MSP_COMMAND_3_FEEDBACK 52
#define MSP_COMMAND_4_FEEDBACK 53
#define MSP_COMMAND_5_FEEDBACK 54
#define MSP_COMMAND_6_FEEDBACK 55
#define MSP_COMMAND_7_FEEDBACK 56
#define MSP_COMMAND_8_FEEDBACK 57

#define MSP_COMMAND_ALL_SPEED_FEEDBACK 58
#define MSP_COMMAND_ALL_ACCEL_FEEDBACK 59
// Define some steppers and the pins the will use

AccelStepper stepper1(AccelStepper::DRIVER, A0, A1);
AccelStepper stepper2(AccelStepper::DRIVER, A2, A3);
AccelStepper stepper3(AccelStepper::DRIVER, A4, A5);
AccelStepper stepper4(AccelStepper::DRIVER, A6, A7);
AccelStepper stepper5(AccelStepper::DRIVER, A8, A9);
AccelStepper stepper6(AccelStepper::DRIVER, A10, A11);
AccelStepper stepper7(AccelStepper::DRIVER, A12, A13);
AccelStepper stepper8(AccelStepper::DRIVER, A14, A15);

//MultiStepper steppers;



int32_t position1, position2, position3, position4, position5, position6, position7, position8;
int32_t position1_old,position2_old,position3_old,position4_old,position5_old,position6_old,position7_old,position8_old;
int32_t current_pos_motor_1, current_pos_motor_2, current_pos_motor_3, current_pos_motor_4, current_pos_motor_5, current_pos_motor_6, current_pos_motor_7, current_pos_motor_8;
int16_t speed_max_1 = 30000, speed_max_2 = 30000, speed_max_3 = 30000, speed_max_4 = 30000, speed_max_5 = 30000, speed_max_6 = 30000, speed_max_7 = 30000, speed_max_8 = 30000;
int16_t accel_1 = 1000, accel_2 = 1000, accel_3 = 1000, accel_4 = 1000, accel_5 = 1000, accel_6 = 1000, accel_7 = 1000, accel_8 = 1000;
int16_t deccel_1, deccel_2, deccel_3, deccel_4, deccel_5, deccel_6, deccel_7, deccel_8;
bool forward_m1 = false, forward_m2 = false, forward_m3 = false, forward_m4 = false, forward_m5 = false, forward_m6 = false, forward_m7 = false, forward_m8 = false;
bool backward_m1 = false, backward_m2 = false, backward_m3 = false, backward_m4 = false, backward_m5 = false, backward_m6 = false, backward_m7 = false, backward_m8 = false;
bool reset_m1, reset_m2, reset_m3, reset_m4, reset_m5, reset_m6, reset_m7, reset_m8;
uint8_t moto1_mode, moto2_mode, moto3_mode, moto4_mode, moto5_mode, moto6_mode, moto7_mode, moto8_mode;
uint8_t motor_1_mode, motor_2_mode, motor_3_mode, motor_4_mode, motor_5_mode, motor_6_mode, motor_7_mode, motor_8_mode;
bool motor1_running,position1_ok,cw_m1_on,ccw_m1_on,position1_start,motor1_pos_is_on,current_pos_m1_kakikomi_ok;
bool motor2_running,position2_ok,cw_m2_on,ccw_m2_on,position2_start,motor2_pos_is_on,current_pos_m2_kakikomi_ok;
bool motor3_running,position3_ok,cw_m3_on,ccw_m3_on,position3_start,motor3_pos_is_on,current_pos_m3_kakikomi_ok;
bool motor4_running,position4_ok,cw_m4_on,ccw_m4_on,position4_start,motor4_pos_is_on,current_pos_m4_kakikomi_ok;
bool motor5_running,position5_ok,cw_m5_on,ccw_m5_on,position5_start,motor5_pos_is_on,current_pos_m5_kakikomi_ok;
bool motor6_running,position6_ok,cw_m6_on,ccw_m6_on,position6_start,motor6_pos_is_on,current_pos_m6_kakikomi_ok;
bool motor7_running,position7_ok,cw_m7_on,ccw_m7_on,position7_start,motor7_pos_is_on,current_pos_m7_kakikomi_ok;
bool motor8_running,position8_ok,cw_m8_on,ccw_m8_on,position8_start,motor8_pos_is_on,current_pos_m8_kakikomi_ok;
//int current_pos_motor_1;
uint8_t case_select;

static uint8_t read8() {
  return inBuf[indRX++] & 0xff;
}
static uint16_t read16() {
  uint16_t t = read8();
  t += (uint16_t)read8() << 8;
  return t;
}
static uint32_t read32() {
  uint32_t t = read16();
  t += (uint32_t)read16() << 16;
  return t;
}

static void serialize8(uint8_t a) {
  Serial1.write(a);
  checksum ^= a;
}
static void serialize16(int16_t a) {
  serialize8((a)&0xFF);
  serialize8((a >> 8) & 0xFF);
}
static void serialize32(uint32_t a) {
  serialize8((a)&0xFF);
  serialize8((a >> 8) & 0xFF);
  serialize8((a >> 16) & 0xFF);
  serialize8((a >> 24) & 0xFF);
}

static void headSerialResponse(uint8_t err, uint8_t s) {
  serialize8('$');
  serialize8('M');
  serialize8(err ? '!' : '>');
  checksum = 0;  // start calculating a new checksum
  serialize8(s);
  serialize8(cmdMSP);
}

static void headSerialReply(uint8_t s) {
  headSerialResponse(0, s);
}

static void headSerialError() {
  headSerialResponse(1, 0);
}

static void tailSerialReply() {
  serialize8(checksum);
}

static void serializeNames(PGM_P s) {
  headSerialReply(strlen_P(s));
  for (PGM_P c = s; pgm_read_byte(c); c++)
    serialize8(pgm_read_byte(c));
  tailSerialReply();
}

static void __attribute__((noinline)) s_struct_w(uint8_t *cb, uint8_t siz) {
  while (siz--) *cb++ = read8();
}

static void s_struct_partial(uint8_t *cb, uint8_t siz) {
  while (siz--) serialize8(*cb++);
}

static void s_struct(uint8_t *cb, uint8_t siz) {
  headSerialReply(siz);
  s_struct_partial(cb, siz);
  tailSerialReply();
}

static void mspAck() {
  headSerialReply(0);
  tailSerialReply();
}

enum MSP_protocol_bytes {
  IDLE,
  HEADER_START,
  HEADER_M,
  HEADER_ARROW,
  HEADER_SIZE,
  HEADER_CMD
};

void protocol() {
  uint8_t c, port, state, bytesTXBuff;
  static uint8_t offset;
  static uint8_t dataSize;
  static uint8_t c_state;
  uint32_t timeMax;  // limit max time in this function in case of GPS

  timeMax = micros();


  while (Serial1.available() > 0) {

    //bytesTXBuff = SerialUsedTXBuff; // indicates the number of occupied bytes in TX buffer
    //if (bytesTXBuff > TX_BUFFER_SIZE - 50 ) return; // ensure there is enough free TX buffer to go further (50 bytes margin)
    c = Serial1.read();
    //#ifdef SUPPRESS_ALL_SERIAL_MSP
    //  evaluateOtherData(c); // no MSP handling, so go directly
    //#else //SUPPRESS_ALL_SERIAL_MSP
    state = c_state;
    // regular data handling to detect and handle MSP and other data
    if (state == IDLE) {
      if (c == '$') {
        state = HEADER_START;
      } else {
        state = IDLE;
      }                                  //evaluateOtherData(c);} // evaluate all other incoming serial data
    } else if (state == HEADER_START) {  //Serial.println(c);
      state = (c == 'M') ? HEADER_M : IDLE;
    } else if (state == HEADER_M) {  //Serial.println(c);
      state = (c == '>') ? HEADER_ARROW : IDLE;
    } else if (state == HEADER_ARROW) {
      if (c > INBUF_SIZE) {  // now we are expecting the payload size
        state = IDLE;
        continue;
      }
      dataSize = c;
      checksum = c;
      offset = 0;
      indRX = 0;
      state = HEADER_SIZE;  // the command is to follow
    } else if (state == HEADER_SIZE) {
      cmdMSP = c;
      checksum ^= c;
      state = HEADER_CMD;
    } else if (state == HEADER_CMD) {
      if (offset < dataSize) {
        checksum ^= c;
        inBuf[offset++] = c;
      } else {
        if (checksum == c)          // compare calculated and transferred checksum
          evaluateCommand(cmdMSP);  // we got a valid packet, evaluate it
        state = IDLE;
      }
    }
    c_state = state;

  }  // while
}
void evaluateCommand(uint8_t c) {
  uint32_t tmp = 0;

  switch (c) {
    
    case MSP_COMMAND_1:
      motor_1_mode = read8();
      speed_max_1 =  read16();
      accel_1 =      read16();
      break;
    case MSP_POSITION_M_1:
      position1 = read32();
      break;
    case MSP_COMMAND_2:
      motor_2_mode = read8();
      speed_max_2 =  read16();
      accel_2 =      read16();
      break;
    case MSP_POSITION_M_2:
      position2 = read32();
      break;
    case MSP_COMMAND_3:
      motor_3_mode = read8();
      speed_max_3 =  read16();
      accel_3 =      read16();
      break;
    case MSP_POSITION_M_3:
      position3 = read32();
      break;
    case MSP_COMMAND_4:
      motor_4_mode = read8();
      speed_max_4 =  read16();
      accel_4 =      read16();
      break;
    case MSP_POSITION_M_4:
      position4 = read32();
      break;
    case MSP_COMMAND_5:
      motor_5_mode = read8();
      speed_max_5 =  read16();
      accel_5 =      read16();
      break;
    case MSP_POSITION_M_5:
      position5 = read32();
      break;
    case MSP_COMMAND_6:
      motor_6_mode = read8();
      speed_max_6 =  read16();
      accel_6 =      read16();
      break;
    case MSP_POSITION_M_6:
      position6 = read32();
      break;
    case MSP_COMMAND_7:
      motor_7_mode = read8();
      speed_max_7 =  read16();
      accel_7 =      read16();
      break;
    case MSP_POSITION_M_7:
      position7 = read32();
      break;
    case MSP_COMMAND_8:
      motor_8_mode = read8();
      speed_max_8 =  read16();
      accel_8 =      read16();
      break;
    case MSP_POSITION_M_8:
      position8 = read32();
      break;
  }
}






void setup() {

  Serial.begin(230400);
  Serial1.begin(230400);
  //stepper1.setMinPulseWidth(50);
  //////////
}

void loop() {
   protocol();
    
//////////////MOTOR 1///////////
   if ((motor_1_mode &0x01)){
     forward_m1 = true;
     backward_m1 = false;
     }
    else forward_m1 = false;
     if ((motor_1_mode &0x02)>>1) {
        backward_m1 = true;
        forward_m1 = false;
     }  
     else backward_m1 = false;
     if ((motor_1_mode &0x04)>>2) {
      reset_m1 = true;
      position1 = 0;
      }
      else reset_m1 = false;
      if ((motor_1_mode &0x08)>>3) {
      position1_start = true;
      }
      else position1_start = false;

//////////////MOTOR 2///////////
if ((motor_2_mode &0x01)){
     forward_m2 = true;
     backward_m2 = false;
     }
    else forward_m2 = false;
     if ((motor_2_mode &0x02)>>1) {
        backward_m2 = true;
        forward_m2 = false;
     }  
     else backward_m2 = false;
     if ((motor_2_mode &0x04)>>2) {
      reset_m2 = true;
      position2 = 0;
      }
      else reset_m2 = false;
      if ((motor_2_mode &0x08)>>3) {
      position2_start = true;
      }
      else position2_start = false;
//////////////MOTOR 3///////////
if ((motor_3_mode &0x01)){
     forward_m3 = true;
     backward_m3 = false;
     }
    else forward_m3 = false;
     if ((motor_3_mode &0x02)>>1) {
        backward_m3 = true;
        forward_m3 = false;
     }  
     else backward_m3 = false;
     if ((motor_3_mode &0x04)>>2) {
      reset_m3 = true;
      position3 = 0;
      }
      else reset_m3 = false;
      if ((motor_3_mode &0x08)>>3) {
      position3_start = true;
      }
      else position3_start = false;
//////////////MOTOR 4///////////
if ((motor_4_mode &0x01)){
     forward_m4 = true;
     backward_m4 = false;
     }
    else forward_m4 = false;
     if ((motor_4_mode &0x02)>>1) {
        backward_m4 = true;
        forward_m4 = false;
     }  
     else backward_m4 = false;
     if ((motor_4_mode &0x04)>>2) {
      reset_m4 = true;
      position4 = 0;
      }
      else reset_m4 = false;
      if ((motor_4_mode &0x08)>>3) {
      position4_start = true;
      }
      else position4_start = false;
//////////////MOTOR 5///////////
   if ((motor_5_mode &0x01)){
     forward_m5 = true;
     backward_m5 = false;
     }
    else forward_m5 = false;
     if ((motor_5_mode &0x02)>>1) {
        backward_m5 = true;
        forward_m5 = false;
     }  
     else backward_m5 = false;
     if ((motor_5_mode &0x04)>>2) {
      reset_m5 = true;
      position5 = 0;
      }
      else reset_m5 = false;
      if ((motor_5_mode &0x08)>>3) {
      position5_start = true;
      }
      else position5_start = false;
//////////////MOTOR 6///////////
   if ((motor_6_mode &0x01)){
     forward_m6 = true;
     backward_m6 = false;
     }
    else forward_m6 = false;
     if ((motor_6_mode &0x02)>>1) {
        backward_m6 = true;
        forward_m6 = false;
     }  
     else backward_m6 = false;
     if ((motor_6_mode &0x04)>>2) {
      reset_m6 = true;
      position6 = 0;
      }
      else reset_m6 = false;
      if ((motor_6_mode &0x08)>>3) {
      position6_start = true;
      }
      else position6_start = false;
//////////////MOTOR 7///////////
   if ((motor_7_mode &0x01)){
     forward_m7 = true;
     backward_m7 = false;
     }
    else forward_m7 = false;
     if ((motor_7_mode &0x02)>>1) {
        backward_m7 = true;
        forward_m7 = false;
     }  
     else backward_m7 = false;
     if ((motor_7_mode &0x04)>>2) {
      reset_m7 = true;
      position7 = 0;
      }
      else reset_m7 = false;
      if ((motor_7_mode &0x08)>>3) {
      position7_start = true;
      }
      else position7_start = false;
//////////////MOTOR 1///////////
   if ((motor_8_mode &0x01)){
     forward_m8 = true;
     backward_m8 = false;
     }
    else forward_m8 = false;
     if ((motor_8_mode &0x02)>>1) {
        backward_m8 = true;
        forward_m8 = false;
     }  
     else backward_m8 = false;
     if ((motor_8_mode &0x04)>>2) {
      reset_m8 = true;
      position8 = 0;
      }
      else reset_m8 = false;
      if ((motor_8_mode &0x08)>>3) {
      position8_start = true;
      }
      else position8_start = false;
///////////////////MOTOR1/ CW & CCW///////////////

  if (forward_m1 == true && motor1_pos_is_on== false) { 
  stepper1.setAcceleration(accel_1);
  stepper1.setMaxSpeed(speed_max_1);
  stepper1.setSpeed(speed_max_1);
  stepper1.runSpeed();
  cw_m1_on = true;}
  if ((cw_m1_on == true)&& (forward_m1 == false)){
    stepper1.setSpeed(0);
    cw_m1_on = false;
    stepper1.setCurrentPosition(current_pos_motor_1);
    delay(10);}
///
  if (backward_m1 == true&& motor1_pos_is_on== false) { 
  stepper1.setAcceleration(accel_1);
  stepper1.setMaxSpeed(speed_max_1);
  stepper1.setSpeed(-1*speed_max_1);
  stepper1.runSpeed();
  ccw_m1_on = true;}
  if ((ccw_m1_on == true)&& (backward_m1 == false)){
    stepper1.setSpeed(0);
    ccw_m1_on = false;
   stepper1.setCurrentPosition(current_pos_motor_1);
   delay(10);}

  if (reset_m1 == true && motor1_pos_is_on== false && stepper1.isRunning () == false) {
     stepper1.setCurrentPosition(0);
     delay(10);
     if (stepper1.currentPosition()==0){current_pos_m1_kakikomi_ok =true;}
     else current_pos_m1_kakikomi_ok =false;}
  current_pos_motor_1 = stepper1.currentPosition();
///////////////////MOTOR2/ CW & CCW///////////////
if (forward_m2 == true && motor2_pos_is_on== false) { 
  stepper2.setAcceleration(accel_2);
  stepper2.setMaxSpeed(speed_max_2);
  stepper2.setSpeed(speed_max_2);
  stepper2.runSpeed();
  cw_m2_on = true;}
  if ((cw_m2_on == true)&& (forward_m2 == false)){
    stepper2.setSpeed(0);
    cw_m2_on = false;
    stepper2.setCurrentPosition(current_pos_motor_2);
    delay(10);}
///
  if (backward_m2 == true&& motor2_pos_is_on== false) { 
  stepper2.setAcceleration(accel_2);
  stepper2.setMaxSpeed(speed_max_2);
  stepper2.setSpeed(-1*speed_max_2);
  stepper2.runSpeed();
  ccw_m2_on = true;}
  if ((ccw_m2_on == true)&& (backward_m2 == false)){
    stepper2.setSpeed(0);
    ccw_m2_on = false;
   stepper2.setCurrentPosition(current_pos_motor_2);
   delay(10);}

  if (reset_m2 == true && motor2_pos_is_on== false && stepper2.isRunning () == false) {
     stepper2.setCurrentPosition(0);
     delay(10);
     if (stepper2.currentPosition()==0){current_pos_m2_kakikomi_ok =true;}
     else current_pos_m2_kakikomi_ok =false;}
  current_pos_motor_2 = stepper2.currentPosition();
///////////////////MOTOR3/ CW & CCW///////////////

  if (forward_m3 == true && motor3_pos_is_on== false) { 
  stepper3.setAcceleration(accel_3);
  stepper3.setMaxSpeed(speed_max_3);
  stepper3.setSpeed(speed_max_3);
  stepper3.runSpeed();
  cw_m3_on = true;}
  if ((cw_m3_on == true)&& (forward_m3 == false)){
    stepper3.setSpeed(0);
    cw_m3_on = false;
    stepper3.setCurrentPosition(current_pos_motor_3);
    delay(10);}
///
  if (backward_m3 == true&& motor3_pos_is_on== false) { 
  stepper3.setAcceleration(accel_3);
  stepper3.setMaxSpeed(speed_max_3);
  stepper3.setSpeed(-1*speed_max_3);
  stepper3.runSpeed();
  ccw_m3_on = true;}
  if ((ccw_m3_on == true)&& (backward_m3 == false)){
    stepper3.setSpeed(0);
    ccw_m3_on = false;
   stepper3.setCurrentPosition(current_pos_motor_3);
   delay(10);}

  if (reset_m3 == true && motor3_pos_is_on== false && stepper3.isRunning () == false) {
     stepper3.setCurrentPosition(0);
     delay(10);
     if (stepper3.currentPosition()==0){current_pos_m3_kakikomi_ok =true;}
     else current_pos_m3_kakikomi_ok =false;}
  current_pos_motor_3 = stepper3.currentPosition();
///////////////////MOTOR4/ CW & CCW///////////////

  if (forward_m4 == true && motor4_pos_is_on== false) { 
  stepper4.setAcceleration(accel_4);
  stepper4.setMaxSpeed(speed_max_4);
  stepper4.setSpeed(speed_max_4);
  stepper4.runSpeed();
  cw_m4_on = true;}
  if ((cw_m4_on == true)&& (forward_m4 == false)){
    stepper4.setSpeed(0);
    cw_m4_on = false;
    stepper4.setCurrentPosition(current_pos_motor_4);
    delay(10);}
///
  if (backward_m4 == true&& motor4_pos_is_on== false) { 
  stepper4.setAcceleration(accel_4);
  stepper4.setMaxSpeed(speed_max_4);
  stepper4.setSpeed(-1*speed_max_4);
  stepper4.runSpeed();
  ccw_m4_on = true;}
  if ((ccw_m4_on == true)&& (backward_m4 == false)){
    stepper4.setSpeed(0);
    ccw_m4_on = false;
   stepper4.setCurrentPosition(current_pos_motor_4);
   delay(10);}

  if (reset_m4 == true && motor4_pos_is_on== false && stepper4.isRunning () == false) {
     stepper4.setCurrentPosition(0);
     delay(10);
     if (stepper4.currentPosition()==0){current_pos_m4_kakikomi_ok =true;}
     else current_pos_m4_kakikomi_ok =false;}
  current_pos_motor_4 = stepper4.currentPosition();
///////////////////MOTOR5/ CW & CCW///////////////

  if (forward_m5 == true && motor5_pos_is_on== false) { 
  stepper5.setAcceleration(accel_5);
  stepper5.setMaxSpeed(speed_max_5);
  stepper5.setSpeed(speed_max_5);
  stepper5.runSpeed();
  cw_m5_on = true;}
  if ((cw_m5_on == true)&& (forward_m5 == false)){
    stepper5.setSpeed(0);
    cw_m5_on = false;
    stepper5.setCurrentPosition(current_pos_motor_5);
    delay(10);}
///
  if (backward_m5 == true&& motor5_pos_is_on== false) { 
  stepper5.setAcceleration(accel_5);
  stepper5.setMaxSpeed(speed_max_5);
  stepper5.setSpeed(-1*speed_max_5);
  stepper5.runSpeed();
  ccw_m5_on = true;}
  if ((ccw_m5_on == true)&& (backward_m5 == false)){
    stepper5.setSpeed(0);
    ccw_m5_on = false;
   stepper5.setCurrentPosition(current_pos_motor_5);
   delay(10);}

  if (reset_m5 == true && motor5_pos_is_on== false && stepper5.isRunning () == false) {
     stepper5.setCurrentPosition(0);
     delay(10);
     if (stepper5.currentPosition()==0){current_pos_m5_kakikomi_ok =true;}
     else current_pos_m5_kakikomi_ok =false;}
  current_pos_motor_5 = stepper5.currentPosition();
///////////////////MOTOR6/ CW & CCW///////////////

  if (forward_m6 == true && motor6_pos_is_on== false) { 
  stepper6.setAcceleration(accel_6);
  stepper6.setMaxSpeed(speed_max_6);
  stepper6.setSpeed(speed_max_6);
  stepper6.runSpeed();
  cw_m6_on = true;}
  if ((cw_m6_on == true)&& (forward_m6 == false)){
    stepper6.setSpeed(0);
    cw_m6_on = false;
    stepper6.setCurrentPosition(current_pos_motor_6);
    delay(10);}
///
  if (backward_m6 == true&& motor6_pos_is_on== false) { 
  stepper6.setAcceleration(accel_6);
  stepper6.setMaxSpeed(speed_max_6);
  stepper6.setSpeed(-1*speed_max_6);
  stepper6.runSpeed();
  ccw_m6_on = true;}
  if ((ccw_m6_on == true)&& (backward_m6 == false)){
    stepper6.setSpeed(0);
    ccw_m6_on = false;
   stepper6.setCurrentPosition(current_pos_motor_6);
   delay(10);}

  if (reset_m6 == true && motor6_pos_is_on== false && stepper6.isRunning () == false) {
     stepper6.setCurrentPosition(0);
     delay(10);
     if (stepper6.currentPosition()==0){current_pos_m6_kakikomi_ok =true;}
     else current_pos_m6_kakikomi_ok =false;}
  current_pos_motor_6 = stepper6.currentPosition();
///////////////////MOTOR7/ CW & CCW///////////////

  if (forward_m7 == true && motor7_pos_is_on== false) { 
  stepper7.setAcceleration(accel_7);
  stepper7.setMaxSpeed(speed_max_7);
  stepper7.setSpeed(speed_max_7);
  stepper7.runSpeed();
  cw_m7_on = true;}
  if ((cw_m7_on == true)&& (forward_m7 == false)){
    stepper7.setSpeed(0);
    cw_m7_on = false;
    stepper7.setCurrentPosition(current_pos_motor_7);
    delay(10);}
///
  if (backward_m7 == true&& motor7_pos_is_on== false) { 
  stepper7.setAcceleration(accel_7);
  stepper7.setMaxSpeed(speed_max_7);
  stepper7.setSpeed(-1*speed_max_7);
  stepper7.runSpeed();
  ccw_m7_on = true;}
  if ((ccw_m7_on == true)&& (backward_m7 == false)){
    stepper7.setSpeed(0);
    ccw_m7_on = false;
   stepper7.setCurrentPosition(current_pos_motor_7);
   delay(10);}

  if (reset_m7 == true && motor7_pos_is_on== false && stepper7.isRunning () == false) {
     stepper7.setCurrentPosition(0);
     delay(10);
     if (stepper7.currentPosition()==0){current_pos_m7_kakikomi_ok =true;}
     else current_pos_m7_kakikomi_ok =false;}
  current_pos_motor_7 = stepper7.currentPosition();
///////////////////MOTOR8/ CW & CCW///////////////

  if (forward_m8 == true && motor8_pos_is_on== false) { 
  stepper8.setAcceleration(accel_8);
  stepper8.setMaxSpeed(speed_max_8);
  stepper8.setSpeed(speed_max_8);
  stepper8.runSpeed();
  cw_m8_on = true;}
  if ((cw_m8_on == true)&& (forward_m8 == false)){
    stepper8.setSpeed(0);
    cw_m8_on = false;
    stepper8.setCurrentPosition(current_pos_motor_8);
    delay(10);}
///
  if (backward_m8 == true&& motor8_pos_is_on== false) { 
  stepper8.setAcceleration(accel_8);
  stepper8.setMaxSpeed(speed_max_8);
  stepper8.setSpeed(-1*speed_max_8);
  stepper8.runSpeed();
  ccw_m8_on = true;}
  if ((ccw_m8_on == true)&& (backward_m8 == false)){
    stepper8.setSpeed(0);
    ccw_m8_on = false;
   stepper8.setCurrentPosition(current_pos_motor_8);
   delay(10);}

  if (reset_m8 == true && motor8_pos_is_on== false && stepper8.isRunning () == false) {
     stepper8.setCurrentPosition(0);
     delay(10);
     if (stepper8.currentPosition()==0){current_pos_m8_kakikomi_ok =true;}
     else current_pos_m8_kakikomi_ok =false;}
  current_pos_motor_8 = stepper8.currentPosition();

//////////////////////////////POSITION M1///////////////////////////////////

    if (position1_start == true || motor1_pos_is_on== true) {
      if (accel_1 == 0) { accel_1 = 1000; }
      stepper1.setAcceleration(accel_1);
      stepper1.setMaxSpeed(speed_max_1);
      stepper1.moveTo(position1);
      stepper1.run();
      motor1_pos_is_on =true;
    if (position1 == stepper1.currentPosition()){motor1_pos_is_on = false;}
    if (stepper1.isRunning () != true){position1_old = position1;}
    }
    if ((position1 == position1_old )&& (position1 == current_pos_motor_1)) {position1_ok =true; }
    else {position1_ok =false;}

  motor1_running = stepper1.isRunning ();
/////////////////////////////POSITION M2////////////////
if (position2_start == true || motor2_pos_is_on== true) {
      if (accel_2 == 0) { accel_2 = 1000; }
      stepper2.setAcceleration(accel_2);
      stepper2.setMaxSpeed(speed_max_2);
      stepper2.moveTo(position2);
      stepper2.run();
      motor2_pos_is_on =true;
    if (position2 == stepper2.currentPosition()){motor2_pos_is_on = false;}
    if (stepper2.isRunning () != true){position2_old = position2;}
    }
    if ((position2 == position2_old )&& (position2 == current_pos_motor_2)) {position2_ok =true; }
    else {position2_ok =false;}

  motor2_running = stepper2.isRunning ();
  //////////////////////////////POSITION M3///////////////////////////////////

    if (position3_start == true || motor3_pos_is_on== true) {
      if (accel_3 == 0) { accel_3 = 1000; }
      stepper3.setAcceleration(accel_3);
      stepper3.setMaxSpeed(speed_max_3);
      stepper3.moveTo(position3);
      stepper3.run();
      motor3_pos_is_on =true;
    if (position3 == stepper3.currentPosition()){motor3_pos_is_on = false;}
    if (stepper3.isRunning () != true){position3_old = position3;}
    }
    if ((position3 == position3_old )&& (position3 == current_pos_motor_3)) {position3_ok =true; }
    else {position3_ok =false;}

  motor3_running = stepper3.isRunning ();
//////////////////////////////POSITION M4///////////////////////////////////

    if (position4_start == true || motor4_pos_is_on== true) {
      if (accel_4 == 0) { accel_4 = 1000; }
      stepper4.setAcceleration(accel_4);
      stepper4.setMaxSpeed(speed_max_4);
      stepper4.moveTo(position4);
      stepper4.run();
      motor4_pos_is_on =true;
    if (position4 == stepper4.currentPosition()){motor4_pos_is_on = false;}
    if (stepper4.isRunning () != true){position4_old = position4;}
    }
    if ((position4 == position4_old )&& (position4 == current_pos_motor_4)) {position4_ok =true; }
    else {position4_ok =false;}

  motor4_running = stepper4.isRunning ();
//////////////////////////////POSITION M5///////////////////////////////////

    if (position5_start == true || motor5_pos_is_on== true) {
      if (accel_5 == 0) { accel_5 = 1000; }
      stepper5.setAcceleration(accel_5);
      stepper5.setMaxSpeed(speed_max_5);
      stepper5.moveTo(position5);
      stepper5.run();
      motor5_pos_is_on =true;
    if (position5 == stepper5.currentPosition()){motor5_pos_is_on = false;}
    if (stepper5.isRunning () != true){position5_old = position5;}
    }
    if ((position5 == position5_old )&& (position5 == current_pos_motor_5)) {position5_ok =true; }
    else {position5_ok =false;}

  motor5_running = stepper5.isRunning ();
//////////////////////////////POSITION M6///////////////////////////////////

    if (position6_start == true || motor6_pos_is_on== true) {
      if (accel_6 == 0) { accel_6 = 1000; }
      stepper6.setAcceleration(accel_6);
      stepper6.setMaxSpeed(speed_max_6);
      stepper6.moveTo(position6);
      stepper6.run();
      motor6_pos_is_on =true;
    if (position6 == stepper6.currentPosition()){motor6_pos_is_on = false;}
    if (stepper6.isRunning () != true){position6_old = position6;}
    }
    if ((position6 == position6_old )&& (position6 == current_pos_motor_6)) {position6_ok =true; }
    else {position6_ok =false;}

  motor6_running = stepper6.isRunning ();
//////////////////////////////POSITION M7///////////////////////////////////

    if (position7_start == true || motor7_pos_is_on== true) {
      if (accel_7 == 0) { accel_7 = 1000; }
      stepper7.setAcceleration(accel_7);
      stepper7.setMaxSpeed(speed_max_7);
      stepper7.moveTo(position7);
      stepper7.run();
      motor7_pos_is_on =true;
    if (position7 == stepper7.currentPosition()){motor7_pos_is_on = false;}
    if (stepper7.isRunning () != true){position7_old = position7;}
    }
    if ((position7 == position7_old )&& (position7 == current_pos_motor_7)) {position7_ok =true; }
    else {position7_ok =false;}

  motor7_running = stepper7.isRunning ();

 //////////////////////////////POSITION M8///////////////////////////////////

    if (position8_start == true || motor8_pos_is_on== true) {
      if (accel_8 == 0) { accel_8 = 1000; }
      stepper8.setAcceleration(accel_8);
      stepper8.setMaxSpeed(speed_max_8);
      stepper8.moveTo(position8);
      stepper8.run();
      motor8_pos_is_on =true;
    if (position8 == stepper8.currentPosition()){motor8_pos_is_on = false;}
    if (stepper8.isRunning () != true){position8_old = position8;}
    }
    if ((position8 == position8_old )&& (position8 == current_pos_motor_8)) {position8_ok =true; }
    else {position8_ok =false;}

  motor8_running = stepper8.isRunning ();
  // Serial.print(motor1_running);          Serial.print("\t");
  // Serial.print(position1_ok);            Serial.print("\t");
  // Serial.print(position1);               Serial.print("\t");
  // Serial.print(position1_old);           Serial.print("\t");
  // Serial.println(current_pos_motor_1);


  /////////////////////////////////////  /////////////////////////////////////
switch (case_select)
{
  case 0:///////////// FEEDBACK MOTOR1/////////////
      moto1_mode = (motor1_running&0x01)|(position1_ok<<1)|(current_pos_m1_kakikomi_ok<<2);
      cmdMSP = MSP_COMMAND_1_FEEDBACK;
      headSerialReply(5);
      serialize8(moto1_mode);
      serialize32(current_pos_motor_1);
      tailSerialReply();
  break;
  case 1:///////////// FEEDBACK MOTOR2/////////////
      moto2_mode = (motor2_running&0x01)|(position2_ok<<1)|(current_pos_m2_kakikomi_ok<<2);
      cmdMSP = MSP_COMMAND_2_FEEDBACK;
      headSerialReply(5);
      serialize8(moto2_mode);
      serialize32(current_pos_motor_2);
      tailSerialReply();
  break;
  case 2:///////////// FEEDBACK MOTOR3/////////////
  moto3_mode = (motor3_running&0x01)|(position3_ok<<1)|(current_pos_m3_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_3_FEEDBACK;
  headSerialReply(5);
  serialize8(moto3_mode);
  serialize32(current_pos_motor_3);
  tailSerialReply();
  break;
  case 3:///////////// FEEDBACK MOTOR4/////////////
  moto4_mode = (motor4_running&0x01)|(position4_ok<<1)|(current_pos_m4_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_4_FEEDBACK;
  headSerialReply(5);
  serialize8(moto4_mode);
  serialize32(current_pos_motor_4);
  tailSerialReply();
  break;
  case 4:///////////// FEEDBACK MOTOR5/////////////
  moto5_mode = (motor5_running&0x01)|(position5_ok<<1)|(current_pos_m5_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_5_FEEDBACK;
  headSerialReply(5);
  serialize8(moto5_mode);
  serialize32(current_pos_motor_5);
  tailSerialReply();
  break;
  case 5:///////////// FEEDBACK MOTOR6/////////////
  moto6_mode = (motor6_running&0x01)|(position6_ok<<1)|(current_pos_m6_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_6_FEEDBACK;
  headSerialReply(5);
  serialize8(moto6_mode);
  serialize32(current_pos_motor_6);
  tailSerialReply();
  break;
case 6:///////////// FEEDBACK MOTOR7/////////////
  moto7_mode = (motor7_running&0x01)|(position7_ok<<1)|(current_pos_m7_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_7_FEEDBACK;
  headSerialReply(5);
  serialize8(moto7_mode);
  serialize32(current_pos_motor_7);
  tailSerialReply();
  break;
case 7:///////////// FEEDBACK MOTOR8/////////////
  moto8_mode = (motor8_running&0x01)|(position8_ok<<1)|(current_pos_m8_kakikomi_ok<<2);
  cmdMSP = MSP_COMMAND_8_FEEDBACK;
  headSerialReply(5);
  serialize8(moto8_mode);
  serialize32(current_pos_motor_8);
  tailSerialReply();
  break;
}
case_select=case_select+1;
if (case_select>7){case_select =0;}
}
