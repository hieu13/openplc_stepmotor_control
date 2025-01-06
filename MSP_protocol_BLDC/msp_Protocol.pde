
int read32() {
//  print(p);print("-");
//print(inBuf[p++]);print("-");print(((inBuf[p++]&0xff)<<8));print("-");print(((inBuf[p++]&0xff)<<16));print("-");println(((inBuf[p++]&0xff)<<24));
return (inBuf[p++]&0xff) + ((inBuf[p++]&0xff)<<8) + ((inBuf[p++]&0xff)<<16) + ((inBuf[p++]&0xff)<<24); }
int read16() {return (inBuf[p++]&0xff) + ((inBuf[p++])<<8); }
int read8()  {return  inBuf[p++]&0xff;}



//send msp without payload
private List<Byte> requestMSP(int msp) {
  return  requestMSP( msp, null);
}

//send multiple msp without payload
private List<Byte> requestMSP (int[] msps) {
  List<Byte> s = new LinkedList<Byte>();
  for (int m : msps) {
    s.addAll(requestMSP(m, null));
  }
  return s;
}

//send msp with payload
private List<Byte> requestMSP (int msp, Character[] payload) {
  if(msp < 0) {
   return null;
  }
  List<Byte> bf = new LinkedList<Byte>();
  for (byte c : MSP_HEADER.getBytes()) {
    bf.add( c );
  }
  
  byte checksum=0;
  byte pl_size = (byte)((payload != null ? int(payload.length) : 0)&0xFF);
  bf.add(pl_size);
  checksum ^= (pl_size&0xFF);
  
  bf.add((byte)(msp & 0xFF));
  checksum ^= (msp&0xFF);
  
  if (payload != null) {
    for (char c :payload){
      bf.add((byte)(c&0xFF));
      checksum ^= (c&0xFF);
    }
  }
  bf.add(checksum);
  return (bf);
}

void sendRequestMSP(List<Byte> msp) {
  byte[] arr = new byte[msp.size()];
  int i = 0;
  for (byte b: msp) {
    arr[i++] = b;
  }
  myPort.write(arr); // send the complete byte sequence in one go
//  println(arr);
}




void protocol_ask(){
  
    time=millis();
  
  if ((time-time2)>50  ){
        time2=time;
        if (i_couter ==0){
          int[] requests = {MSP_MOTOR_POS, MSP_MOTOR_VOL, MSP_MOTOR_PID_VEL_P};
          sendRequestMSP(requestMSP(requests));   
          }
      if (i_couter ==1){
          int[] requests = {MSP_MOTOR_VEL, MSP_MOTOR_VOLLIMIT, MSP_MOTOR_PID_P};
          sendRequestMSP(requestMSP(requests));   
          }   
     if (i_couter ==2){
          int[] requests = {MSP_MOTOR_PID_VEL_D, MSP_MOTOR_MODE, MSP_MOTOR_ACCEL_DECCEL};
          sendRequestMSP(requestMSP(requests));   
          }
     if (i_couter ==3){
          int[] requests = {MSP_MOTOR_PID_VEL_I};
          sendRequestMSP(requestMSP(requests));   
          }  
      if (i_couter ==4){
          int[] requests = {MSP_MOTOR_FB_ICHI};
          sendRequestMSP(requestMSP(requests));   
          }
      if (i_couter ==5){
          int[] requests = {MSP_MOTOR_FB_VEL_ACC_DEC_M1,MSP_MOTOR_FB_VEL_ACC_DEC_M2};
          sendRequestMSP(requestMSP(requests));   
          }
      i_couter +=1;
  if(i_couter>5) i_couter=0;
      //sendRequestMSP(requestMSP(MSP_MOTOR_POS));
      }
  
 // println("yes");
  
  
}


void protocol_loop(){
  
  int c, i;
  
 while (myPort.available()>0) {
    c = (myPort.read());
    
    if (c_state == IDLE) {
      c_state = (c=='$') ? HEADER_START : IDLE;
    } else if (c_state == HEADER_START) {
      c_state = (c=='M') ? HEADER_M : IDLE;
    } else if (c_state == HEADER_M) {
      if (c == '>') {
        c_state = HEADER_ARROW;
      } else if (c == '!') {
        c_state = HEADER_ERR;
      } else {
        c_state = IDLE;
      }
    } else if (c_state == HEADER_ARROW || c_state == HEADER_ERR) {
      /* is this an error message? */
      err_rcvd = (c_state == HEADER_ERR);        /* now we are expecting the payload size */
      dataSize = (c&0xFF);
      /* reset index variables */
      p = 0;
      offset = 0;
      checksum = 0;
      checksum ^= (c&0xFF);
      /* the command is to follow */
      c_state = HEADER_SIZE;
    } else if (c_state == HEADER_SIZE) {
      cmd = (byte)(c&0xFF);
      checksum ^= (c&0xFF);
      c_state = HEADER_CMD;
    } else if (c_state == HEADER_CMD && offset < dataSize) {
      checksum ^= (c&0xFF);
      inBuf[offset++] = (byte)(c&0xFF);
    } else if (c_state == HEADER_CMD && offset >= dataSize) {
      /* compare calculated and transferred checksum */
      if ((checksum&0xFF) == (c&0xFF)) {
        if (err_rcvd) {
          System.err.println("Copter did not understand request type "+c);
        } else {
          /* we got a valid response packet, evaluate it */
          evaluateCommand(cmd, (int)dataSize);
        }
      } else {
        println("invalid checksum for command "+((int)(cmd&0xFF))+": "+(checksum&0xFF)+" expected, got "+(int)(c&0xFF));
        print("<"+(cmd&0xFF)+" "+(dataSize&0xFF)+"> {");
        for (i=0; i<dataSize; i++) {
          if (i!=0) {
            print(' ');
          }
          print((inBuf[i] & 0xFF));
        }
        println("} ["+c+"]");
        println(new String(inBuf, 0, dataSize));
      }
      c_state = IDLE;
    }
  }
}

/*
float current_pos_11,current_pos_12,current_pos_21,current_pos_22,
      current_vel11,current_vel12,current_vel21,current_vel22;

int current_accel1,current_accel2,current_deccel1,current_deccel2;
float current_vol_in1,current_vol_in2,current_vol_limit1,current_vol_limit2;

float pid_pos_p1,pid_pos_p2,pid_vel_p1,pid_vel_p2,pid_vel_i1,pid_vel_i2,pid_vel_d1,pid_vel_d2;
*/


public void evaluateCommand(byte cmd, int dataSize) {

  int icmd = (int)(cmd&0xFF);
  switch(icmd) {
    case MSP_MOTOR_MODE:
        error= read8();
        run_mode_val = read8();
        cur_motor_number = read8();
        
        motor1_resolution =read8();
        motor2_resolution =read8();
        motor1_pole =read8();
        motor2_pole =read8();
        
        data_motor1 =read8();
        data_motor2 =read8();
      //  println(run_mode_val);
        control_motion_1 =read8();
        control_motion_2 =read8();
      
       break;
    case MSP_MOTOR_POS:
       current_pos_11 = read32();
       current_pos_12 = read32();
       current_pos_21 = read32();
       current_pos_22 = read32();
       
       
       
     //  println(floatValue);
        break;
    case MSP_MOTOR_VEL:
      current_vel11 = read16();
       current_vel12 = read16();
       current_vel21 = read16();
       current_vel22 = read16();
       break;
    case MSP_MOTOR_ACCEL_DECCEL:
     current_accel1 = read16();
      current_accel2 = read16();
       current_deccel1 = read16();
        current_deccel2 = read16();
        break;
    case MSP_MOTOR_VOL:
      current_vol_in1 = read32();
       current_vol_in2 = read32();

        break;
    case MSP_MOTOR_VOLLIMIT:
      current_vol_limit1 = read32();
       current_vol_limit2 = read32();
        break;
    case MSP_MOTOR_PID_P:
     pid_pos_p1 =read32();
     pid_pos_p2 =read32();
        break;
    case MSP_MOTOR_PID_VEL_P:
    pid_vel_p1 =read32();
     pid_vel_p2 =read32();
        break;
    ////
    case MSP_MOTOR_PID_VEL_I:
     pid_vel_i1 =read32();
     pid_vel_i2 =read32();
       break;
    case MSP_MOTOR_PID_VEL_D:
    pid_vel_d1 =read32();
     pid_vel_d2 =read32();
        break;
    case MSP_MOTOR_FB_ICHI:
     position_now_motor1 =read32();
     position_now_motor2 =read32();
       break;
    
    case MSP_MOTOR_FB_VEL_ACC_DEC_M1:
       now_velocity_1 = read16();
       now_acceleration_1 = read16();
       now_decceleration_1 = read16();
      // println(now_velocity_1);
       
        break;
    case MSP_MOTOR_FB_VEL_ACC_DEC_M2:
       now_velocity_2 = read16();
       now_acceleration_2 = read16();
       now_decceleration_2 = read16();
        break;
    case MSP_MOTOR_RUN_SET:
     //   println("handle reply "+icmd);
        break;

    ////
    
        
    default:
        println("Don't know how to handle reply "+icmd);
  }
}
