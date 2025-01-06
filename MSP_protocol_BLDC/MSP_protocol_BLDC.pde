//package com.mkyong.math.rounding;

import java.math.RoundingMode;
import java.text.DecimalFormat;


import processing.serial.Serial;
import controlP5.*;
import processing.opengl.*;
import java.lang.StringBuffer; // for efficient String concatemation
import javax.swing.SwingUtilities; // required for swing and EDT
import javax.swing.JFileChooser; // Saving dialogue
import javax.swing.filechooser.FileFilter; // for our configuration file filter "*.mwi"
import javax.swing.JOptionPane; // for message dialogue

//Added For  Processing 2.0.x compabillity
import java.util.*;
import java.io.*;

ControlP5 cp5;
ControlTimer ctr_time,read_data_time;
// Port one communication setup:
Serial myPort; // create a Serial port instance
String commPort = "COM4";
int baud = 115200;
char parity = 'N';
int dataBits = 8;
float stopBits = 1.0;


int timeout = 2000;
int polling = 5;
int no_of_retries = 5;
int total_no_of_packets = 1;
int data_motor1,data_motor2;
int temp_memo =0;
float[] set_position = new float[8]; // to store the requested data
float[] set_speed = new float[8]; // data to be written using
float[] set_accel = new float[8]; // data to be written using
int[] set_run_mode = new int[10]; // data to be written using

float[] current_pos = new float[8]; // data to be written using
int[] motor_fb = new int[8]; // data to be written using

int set_mode_m1,set_mode_m2,set_mode_m3,set_mode_m4,set_mode_m5,set_mode_m6,set_mode_m7,set_mode_m8;
int cur_mode_m1,cur_mode_m2,cur_mode_m3,cur_mode_m4,cur_mode_m5,cur_mode_m6,cur_mode_m7,cur_mode_m8;
//////////////////////////////////////////////////////////////////////////////////
float position_idou_motor1,idou_bunkai_m1=0.01,position_idou_motor2,idou_bunkai_m2=0.01;

PFont font_small, font_medium, font_big, font10, font12, font15, font17, font21;
Textlabel txtlblWhichcom, txtlblcom_connect, run_mode, error_mode, current_motor_number,
          Resolution_1, Resolution_2, analog_ch5, Pole_Pairs_1, Pole_Pairs_2,
          motor_fb_ch0,motor_fb_ch1,motor_fb_ch2,motor_fb_ch3,motor_fb_ch4,motor_fb_ch5,motor_fb_ch6,motor_fb_ch7,
          m1_p1_set,m1_p2_set,m2_p1_set,m2_p2_set,m1_v1_set,m1_v2_set,m2_v1_set,m2_v2_set,
          accel1_text,accel2_text,deccel1_text,deccel2_text,
          PID_POSITION1,PID_POSITION2,PID_VELOCITY1,PID_VELOCITY2,VOL_INPUT1,VOL_INPUT2,VOL_LIMIT1,VOL_LIMIT2,
          text_P_pos_1,text_P_vel_1,text_volin_1,text_vol_limit1,text_P_pos_2,text_P_vel_2,text_volin_2,text_vol_limit2,
          text_I_pos_1,text_I_pos_2,text_I_vel_1,text_I_vel_2,text_D_pos_1,text_D_pos_2,text_D_vel_1,text_D_vel_2,
          text_ofset_m1,text_ofset_m2;
  
Button buttonSTART, buttonSTOP, buttonSETTING, btnQConnect, buttonSEND, btnRefresh,
        button_run_pos_m1,POS_1_M2_RUN,POS_1_M1_RUN,bt_motor4_pos,button_run_pos_m2,bt_motor6_pos,
        bt_motor7_pos,bt_motor8_pos,bt_motor1_cw,POS_2_M2_RUN,POS_2_M1_RUN,bt_motor4_cw,
        bt_motor5_cw,bt_motor6_cw,bt_motor7_cw,bt_motor8_cw,bt_motor1_ccw,Save_m2,
        save_m1_pos,bt_motor4_ccw,bt_motor5_ccw,bt_motor6_ccw,bt_motor7_ccw,bt_motor8_ccw,
        bt_motor1_zero,Default_m2,Default_m1,bt_motor4_zero,bt_motor5_zero,bt_motor6_zero,bt_motor7_zero,bt_motor8_zero,
        bt_motor1_stop,bt_motor4_stop,bt_motor5_stop,bt_motor6_stop,bt_motor7_stop,bt_motor8_stop
        ,bt_save_para,bt_reset_para,bt_save_para1,bt_reset_para1,bt_save_para2,bt_reset_para2,
        GENTEN_1_RUN,GENTEN_2_RUN;
RadioButton checkbox_speed_m1,checkbox_speed_m2,checkbox_control_m1,checkbox_control_m2;        
Toggle bt_motor1_active,STATUS_m2,STATUS_m1,bt_motor4_active,bt_motor5_active,bt_motor6_active,bt_motor7_active,bt_motor8_active,
       bt_motor1_running,bt_motor2_running,bt_motor3_running,bt_motor4_running,bt_motor5_running,bt_motor6_running,bt_motor7_running,bt_motor8_running,
       button_run_pos_m1ok,POS_1_M2_RUNok,POS_1_M1_RUNok,bt_motor4_posok,button_run_pos_m2ok,bt_motor6_posok,bt_motor7_posok,bt_motor8_posok,
       bt_motor1_zerook,Default_m2ok,Default_m1ok,bt_motor4_zerook,bt_motor5_zerook,bt_motor6_zerook,bt_motor7_zerook,bt_motor8_zerook,
       mode1_active,mode2_active,mode3_active,disable_m1,disable_m2;
       
boolean bt_motor1_act = false,bt_motor2_act = false,bt_motor3_act = false,bt_motor4_act = false,bt_motor5_act = false,bt_motor6_act = false,bt_motor7_act = false,bt_motor8_act = false,
        bt_motor1_run = false,bt_motor2_run = false,bt_motor3_run = false,bt_motor4_run = false,bt_motor5_run = false,bt_motor6_run = false,bt_motor7_run = false,bt_motor8_run = false,
        button_run_pos_m1ition_ok,POS_1_M2_RUNition_ok,POS_1_M1_RUNition_ok,bt_motor4_position_ok,button_run_pos_m2ition_ok,bt_motor6_position_ok,bt_motor7_position_ok,bt_motor8_position_ok,
        bt_motor1_kaki_ok,bt_motor2_kaki_ok,bt_motor3_kaki_ok,bt_motor4_kaki_ok,bt_motor5_kaki_ok,bt_motor6_kaki_ok,bt_motor7_kaki_ok,bt_motor8_kaki_ok,
        mode1_active_val= false,mode2_active_val=false,mode3_active_val=false
        ,read_data_on =false,ontime=false,motor_1_dis=false,motor_2_dis=false;

Textarea myTextarea;

ListBox commListbox, baudListbox;
Chart motor_1_Chart, motor_2_Chart;

Numberbox number_runmode, number_error_mode, number_motor, current_motor_num, Resolution_m1,Resolution_m2, Pole_Pairs_m1, Pole_Pairs_m2,
          cur_number_runmode, cur_number_error_mode, cur_number_motor, cur_current_motor_num, cur_Resolution_m1,
          cur_Resolution_m2, cur_Pole_Pairs_m1, cur_Pole_Pairs_m2,
          P_pos_1,P_pos_2,P_vel_1,P_vel_2,volin_1,volin_2,vol_limit1,vol_limit2,I_pos_1,I_pos_2,I_vel_1,I_vel_2,D_pos_1,D_pos_2,D_vel_1,D_vel_2,
          
          CUR_pos_1,CUR_speed_1,CUR_acc_1,CUR_dec_1,CUR_pos_2,CUR_speed_2,CUR_acc_2,CUR_dec_2,
          mode_motor1,mode_motor2,mode_motor3,mode_motor4,mode_motor5,mode_motor6,mode_motor7,mode_motor8,
          SET_pos_1,SET_speed_1,SET_acc_1,SET_dec_1,SET_pos_2,SET_speed_2,SET_acc_2,SET_dec_2,
          pos_m1_p1,pos_m1_p2,pos_m2_p1,pos_m2_p2,vel_m1_p1,vel_m1_p2,vel_m2_p1,vel_m2_p2,accel_m1,accel_m2,deccel_m1,deccel_m2,
          cur_pos_m1_p1,cur_pos_m1_p2,cur_pos_m2_p1,cur_pos_m2_p2,cur_vel_m1_p1,cur_vel_m1_p2,cur_vel_m2_p1,cur_vel_m2_p2,cur_accel_m1,cur_accel_m2,cur_deccel_m1,cur_deccel_m2;

Println console;


color yellow_ = color(200, 200, 20), 
      green_ = color(30, 120, 30), 
      red_ = color(120, 30, 30), 
      blue_ = color(50, 50, 100),
      grey_ = color(30, 30, 30),
      black_ = color(0, 0, 0), 
      orange_ =color(200, 128, 0),
      white_ =color(255, 255,255);
      
boolean graphEnabled=false, select_index0=false, select_index1=false, Serial_activate = false,
  Cam1_trig = false, Cam2_trig = false;
int i_couter;
int error,run_mode_val,cur_motor_number,motor_ready,motor_ss,motor1_resolution,motor2_resolution,motor1_pole,motor2_pole;
int current_pos_11,current_pos_12,current_pos_21,current_pos_22,
    current_vel11,current_vel12,current_vel21,current_vel22,
    position_now_motor1,position_now_motor2,now_velocity_1,now_velocity_2,now_acceleration_1,now_acceleration_2,now_decceleration_1,now_decceleration_2;

float value_ichi_m1_after,value_ichi_m2_after;
float ofset_O_position_1,ofset_O_position_2;
int control_motion_1,control_motion_2;
int current_accel1,current_accel2,current_deccel1,current_deccel2;
int current_vol_in1,current_vol_in2,current_vol_limit1,current_vol_limit2;

int pid_pos_p1,pid_pos_p2,pid_vel_p1,pid_vel_p2,pid_vel_i1,pid_vel_i2,pid_vel_d1,pid_vel_d2;
int temp_control1,temp_control2;

float[] floatValue = new float[20];

int GUI_BaudRate = 115200;
int init_com, commListMax;
int tab_0 =1, tab_1 =0, tab_2 =0, tab_3 =0, tab_4 =0;
float ax, ay, az;
String s = "", portPos;
String[] port_name;
String shortifyPortName(String portName, int maxlen) {
  String shortName = portName;
  if (shortName.startsWith("/dev/cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}
///////////////////////////////////////////

/******************************* Multiwii Serial Protocol **********************/
private static final String MSP_HEADER = "$M>";

private static final int


 MSP_MOTOR_MODE =100,
 MSP_MOTOR_POS =101,
 MSP_MOTOR_VEL =102,
 MSP_MOTOR_ACCEL_DECCEL =103,
 MSP_MOTOR_VOL =104,
 MSP_MOTOR_VOLLIMIT =105,
 MSP_MOTOR_PID_P =106,
 MSP_MOTOR_PID_VEL_P =107,
 MSP_MOTOR_PID_VEL_I =108,
 MSP_MOTOR_PID_VEL_D =109,
//////////////////
 MSP_MOTOR_MOTOR_SET =1,
 MSP_MOTOR_MODE_SET =2,
 MSP_MOTOR_SAVE_SET =3,
 MSP_MOTOR_RESET_SET= 4,
 MSP_MOTOR_RUN_SET = 5,
  MSP_MOTOR_ERROR_SET = 6,// newe
  MSP_MOTOR_NC_SET = 7,//new
MSP_MOTOR_DATAPOS1_SET = 8,
MSP_MOTOR_DATAPOS2_SET = 9,
MSP_MOTOR_PARASAVE1_SET = 34,
MSP_MOTOR_PARASAVE2_SET = 35,

 MSP_MOTOR_POS11_SET =10,
 MSP_MOTOR_POS12_SET =11,
 MSP_MOTOR_POS21_SET =12,
 MSP_MOTOR_POS22_SET =13,

 MSP_MOTOR_VEL11_SET =14,
 MSP_MOTOR_VEL12_SET=15,
 MSP_MOTOR_VEL21_SET =16,
 MSP_MOTOR_VEL22_SET =17,

 MSP_MOTOR_ACCEL1_SET =18,
 MSP_MOTOR_ACCEL2_SET =19,
 MSP_MOTOR_DECCEL1_SET =20,
 MSP_MOTOR_DECCEL2_SET =21,

 MSP_MOTOR_VOL_M1_SET =22,
 MSP_MOTOR_VOL_M2_SET =23,

 MSP_MOTOR_VOLLIMIT_M1_SET =24,
 MSP_MOTOR_VOLLIMIT_M2_SET =25,
 MSP_MOTOR_PID_P_M1_SET =26,
 MSP_MOTOR_PID_P_M2_SET =27,
 MSP_MOTOR_PID_VEL_P_M1_SET =28,
 MSP_MOTOR_PID_VEL_P_M2_SET =29,
 MSP_MOTOR_PID_VEL_I_M1_SET =30,
 MSP_MOTOR_PID_VEL_I_M2_SET =31,
 MSP_MOTOR_PID_VEL_D_M1_SET =32,
 MSP_MOTOR_PID_VEL_D_M2_SET =33,
 MSP_MOTOR_FB_ICHI =50,
 MSP_MOTOR_FB_VEL_ACC_DEC_M1 =51,
  MSP_MOTOR_FB_VEL_ACC_DEC_M2 =52,
  
  MSP_MOTOR_IDOU_1_SET =60,
  MSP_MOTOR_IDOU_2_SET=61,
  MSP_MOTOR_ACC_DEC_1_SET=62,
  MSP_MOTOR_ACC_DEC_2_SET=63,
  MSP_MOTOR_SPEED_1_SET=64,
  MSP_MOTOR_SPEED_2_SET=65,
  //
  MSP_MOTOR_DISABLE_MOTOR_SET =66,
  MSP_MOTOR_RESO1_SET =67,
  MSP_MOTOR_RESO2_SET =68,
  MSP_MOTOR_POLE_1_SET =69,
  MSP_MOTOR_POLE_2_SET =70,
  MSP_MOTOR_MODE_RUN =71,
  MSP_MOTOR_MOTION_CONTROL1 =72,
  MSP_MOTOR_MOTION_CONTROL2 =73;
  



public static final int
  IDLE         = 0,
  HEADER_START = 1,
  HEADER_M     = 2,
  HEADER_ARROW = 3,
  HEADER_SIZE  = 4,
  HEADER_CMD   = 5,
  HEADER_ERR   = 6
  ;

int c_state = IDLE;
boolean err_rcvd = false;

byte checksum=0;
byte cmd;
int offset=0, dataSize=0;
byte[] inBuf = new byte[256];

int mode;
int p;
List<Character> payload;
private int present = 0;
int time,time2,time3,time4,time5,time6;
///////////////////////////////////////////

private static final DecimalFormat df = new DecimalFormat("0.00");

void setup()
{
  //timer
  ctr_time = new ControlTimer();
  ctr_time.setSpeedOfTime(10);
  
  //

  font_small = createFont("Arial bold", 9, false);
  font_medium = createFont("Arial bold", 13, false);
  font_big = createFont("Arial bold", 19, false);
  font10 = createFont("Arial bold", 10, false);
  font12 = createFont("Arial bold", 12, false);
  font15 = createFont("Arial bold", 15, false);
  font17 = createFont("Arial bold", 17, false);
  font21 = createFont("Arial bold", 21, false);

  //  PFont font_small,font_medium,font_big;
  size(1250, 650);
  cp5 = new ControlP5(this);


  createGUI();
  set_table_data();

}

void draw()
{

  background(150);
  
  

  //while (myPort.available()>0) {
  //    data_recv = (myPort.read());
  //    dt_rc = str(hour())+":"+str(minute())+":"+str(second())+"<<"+str(data_recv);
  //    myTextarea.append(dt_rc,255);
  //    myTextarea.setColor(0xffffefff);
  //    println(data_recv);
  //}
  ///////////////////////MSP LOOP///////////////////////
if(Serial_activate == true){ 
 protocol_ask();
 protocol_loop();
}
  

  if(Serial_activate == true && ontime ==false){read_data_time = new ControlTimer();read_data_time.setSpeedOfTime(10);ontime = true;}
  
  if (read_data_on == false && Serial_activate == true)
  {
  update();
  if(read_data_time.time()>1000){
    read_data_on =true;
    println("RUN");
  }
  }
  /////////////////SET
  update_always();
  update_motor();
  update_mode();
  
  motor_1_Chart.push("incoming", (value_ichi_m1_after));
  motor_2_Chart.push("incoming", (value_ichi_m2_after));
  
  ///// TIMER DATA WRITE/////

  if (ctr_time.time()>1000 && Serial_activate == true ) {
    
    saveData();
    
   // println(ctr_time.time());
    ctr_time.reset();
  }
  
  
  
}



void update_always(){
  
   floatValue[1] = Float.intBitsToFloat(current_pos_11);
   floatValue[2] = Float.intBitsToFloat(current_pos_12);
   floatValue[3] = Float.intBitsToFloat(current_pos_21);
   floatValue[4] = Float.intBitsToFloat(current_pos_22);
   floatValue[5] = Float.intBitsToFloat(pid_pos_p1);
   floatValue[6] = Float.intBitsToFloat(pid_pos_p2);
   floatValue[7] = Float.intBitsToFloat(pid_vel_p1);
   floatValue[8] = Float.intBitsToFloat(pid_vel_p2);
   floatValue[9] = Float.intBitsToFloat(pid_vel_i1);
   floatValue[10] = Float.intBitsToFloat(pid_vel_i2);
   floatValue[11] = Float.intBitsToFloat(pid_vel_d1);
   floatValue[12] = Float.intBitsToFloat(pid_vel_d2);
   floatValue[13] = Float.intBitsToFloat(current_vol_in1);
   floatValue[14] = Float.intBitsToFloat(current_vol_in2);
   floatValue[15] = Float.intBitsToFloat(current_vol_limit1);
   floatValue[16] = Float.intBitsToFloat(current_vol_limit2);
   
   floatValue[17] = Float.intBitsToFloat(position_now_motor1);
   floatValue[18] = Float.intBitsToFloat(position_now_motor2);
  println(current_pos_11);
  println(current_pos_12);
  println(current_pos_21);
  println(current_pos_22);
  
  cur_number_runmode.setValue(run_mode_val);
  cur_number_error_mode.setValue(error);
  cur_number_motor.setValue(cur_motor_number);
  
  cur_Resolution_m1.setValue(motor1_resolution);
  cur_Resolution_m2.setValue(motor2_resolution);
  cur_Pole_Pairs_m1.setValue(motor1_pole);
  cur_Pole_Pairs_m2.setValue(motor2_pole);
  //
  cur_pos_m1_p1.setValue(floatValue[1]);
  cur_pos_m1_p2.setValue(floatValue[2]);
  cur_pos_m2_p1.setValue(floatValue[3]);
  cur_pos_m2_p2.setValue(floatValue[4]);
  //
  cur_vel_m1_p1.setValue(current_vel11);
  cur_vel_m1_p2.setValue(current_vel12);
  cur_vel_m2_p1.setValue(current_vel21);
  cur_vel_m2_p2.setValue(current_vel22);
  
  cur_accel_m1.setValue(current_accel1);
  cur_deccel_m1.setValue(current_deccel1);
  cur_accel_m2.setValue(current_accel2);
  cur_deccel_m2.setValue(current_deccel2);
  ///
  text_P_pos_1.setText("("+str(floatValue[5])+")");
  text_P_pos_2.setText("("+str(floatValue[6])+")");
  text_P_vel_1.setText("("+str(floatValue[7])+")");
  text_P_vel_2.setText("("+str(floatValue[8])+")");
  text_I_vel_1.setText("("+str(floatValue[9])+")");
  text_I_vel_2.setText("("+str(floatValue[10])+")");
  text_D_vel_1.setText("("+str(floatValue[11])+")");
  text_D_vel_2.setText("("+str(floatValue[12])+")");
  text_volin_1.setText("("+str(floatValue[13])+")");
  text_volin_2.setText("("+str(floatValue[14])+")");
  text_vol_limit1.setText("("+str(floatValue[15])+")");
  text_vol_limit2.setText("("+str(floatValue[16])+")");
  //
  value_ichi_m1_after =float(df.format(floatValue[17]*0.01))-ofset_O_position_1;
  value_ichi_m2_after =float(df.format(floatValue[18]*0.01))-ofset_O_position_2;
  CUR_pos_1.setValue(value_ichi_m1_after);
  CUR_pos_2.setValue(value_ichi_m2_after);
  //
  CUR_speed_1.setValue(now_velocity_1);
  CUR_speed_2.setValue(now_velocity_2);
  CUR_acc_1.setValue(now_acceleration_1);
  CUR_acc_2.setValue(now_acceleration_2);
  CUR_dec_1.setValue(now_decceleration_1);
  CUR_dec_2.setValue(now_decceleration_2);
  
  text_ofset_m1.setText("ofset("+str(ofset_O_position_1)+")");
  text_ofset_m2.setText("ofset("+str(ofset_O_position_2)+")");
  
  if (data_motor1 ==5 && data_motor1 ==14|| error ==3){disable_m1.setColorBackground(color(255,0,0));}
  if (data_motor2 ==5 && data_motor2 ==14|| error ==4){disable_m2.setColorBackground(color(255,0,0));}
  

  if (data_motor1 ==4 && disable_m1.getValue() == 0 && error ==0){disable_m1.setColorBackground(color(0,255,0));}
  if (data_motor2 ==4 && disable_m2.getValue() == 0 && error ==0){disable_m2.setColorBackground(color(0,255,0));}
  
if (control_motion_1==0 ){checkbox_control_m1.setArrayValue(0,1);}
  if (control_motion_1==1 ){checkbox_control_m1.setArrayValue(1,1);}
  if (control_motion_1==2 ){checkbox_control_m1.setArrayValue(2,1);}
  if (control_motion_1==3 ){checkbox_control_m1.setArrayValue(3,1);}
  if (control_motion_1==4 ){checkbox_control_m1.setArrayValue(4,1);}
   

   
   
   
   if (control_motion_2==0 ){checkbox_control_m2.setArrayValue(0,1);}
  if (control_motion_2==1 ){checkbox_control_m2.setArrayValue(1,1);}
  if (control_motion_2==2 ){checkbox_control_m2.setArrayValue(2,1);}
  if (control_motion_2==3 ){checkbox_control_m2.setArrayValue(3,1);}
  if (control_motion_2==4 ){checkbox_control_m2.setArrayValue(4,1);}
  
 
  
}



void update_motor(){
  if (cur_number_motor.getValue()==1){
  disable_m2.setLock(true);
  disable_m2.setColorBackground(color(255,0,0));
  
  bt_motor1_act= true;bt_motor5_act =false; 
  bt_motor1_active.setValue(bt_motor1_act);bt_motor5_active.setValue(bt_motor5_act);
  STATUS_m2.setValue(bt_motor5_act);STATUS_m1.setValue(bt_motor1_act);
 // STATUS_m2.setColorBackground(green_);STATUS_m1.setColorBackground(red_);
 }
  else if (cur_number_motor.getValue()==2){
  disable_m2.setLock(false);
  bt_motor1_act= true;bt_motor5_act =true;
  bt_motor1_active.setValue(bt_motor1_act);bt_motor5_active.setValue(bt_motor5_act);
  STATUS_m2.setValue(bt_motor5_act);STATUS_m1.setValue(bt_motor1_act);
//  STATUS_m2.setColorBackground(green_);STATUS_m1.setColorBackground(green_);
}
    else{ 
    bt_motor1_act= false;bt_motor5_act =false;
    bt_motor1_active.setValue(bt_motor1_act);bt_motor5_active.setValue(bt_motor5_act);
    STATUS_m2.setValue(bt_motor5_act);STATUS_m1.setValue(bt_motor1_act);
 //   STATUS_m2.setColorBackground(red_);STATUS_m1.setColorBackground(red_);
  }
    
}


void update_mode(){
  if (cur_number_runmode.getValue()==1){mode1_active_val=true;mode2_active_val=false;mode3_active_val=false;
        mode1_active.setValue(mode1_active_val);mode2_active.setValue(mode2_active_val);mode3_active.setValue(mode3_active_val);}
    else if (cur_number_runmode.getValue()==2){mode1_active_val=false;mode2_active_val=true;mode3_active_val=false;
        mode1_active.setValue(mode1_active_val);mode2_active.setValue(mode2_active_val);mode3_active.setValue(mode3_active_val);}
      else if (cur_number_runmode.getValue()==3){mode1_active_val=false;mode2_active_val=false;mode3_active_val=true;
        mode1_active.setValue(mode1_active_val);mode2_active.setValue(mode2_active_val);mode3_active.setValue(mode3_active_val);}
        else {mode1_active_val=false;mode2_active_val=false;mode3_active_val=false;
        mode1_active.setValue(mode1_active_val);mode2_active.setValue(mode2_active_val);mode3_active.setValue(mode3_active_val);}
}


void update(){

  
  
  ////////////////////////////////////////////////////
  /////CHART analog
  number_runmode.setValue(run_mode_val);
  number_error_mode.setValue(error);
  number_motor.setValue(cur_motor_number);
  
  Resolution_m1.setValue(motor1_resolution);
  Resolution_m2.setValue(motor2_resolution);
  Pole_Pairs_m1.setValue(motor1_pole);
  Pole_Pairs_m2.setValue(motor2_pole);
  
  //println(motor1_resolution);
  //
  pos_m1_p1.setValue(floatValue[1]);
  pos_m1_p2.setValue(floatValue[2]);
  pos_m2_p1.setValue(floatValue[3]);
  pos_m2_p2.setValue(floatValue[4]);
  
  vel_m1_p1.setValue(current_vel11);
  vel_m1_p2.setValue(current_vel12);
  vel_m2_p1.setValue(current_vel21);
  vel_m2_p2.setValue(current_vel22);
  
  accel_m1.setValue(current_accel1);
  deccel_m1.setValue(current_deccel1);
  accel_m2.setValue(current_accel2);
  deccel_m2.setValue(current_deccel2);
  
  P_pos_1.setValue(floatValue[5]);
  P_pos_2.setValue(floatValue[6]);
  
  P_vel_1.setValue(floatValue[7]);
  P_vel_2.setValue(floatValue[8]);
  
  I_vel_1.setValue(floatValue[9]);
  I_vel_2.setValue(floatValue[10]);
  
  D_vel_1.setValue(floatValue[11]);
  D_vel_2.setValue(floatValue[12]);
  
  volin_1.setValue(floatValue[13]);
  volin_2.setValue(floatValue[14]);
  
  vol_limit1.setValue(floatValue[15]);
  vol_limit2.setValue(floatValue[16]);

  if(control_motion_1==0){checkbox_control_m1.activate(0).deactivate(1).deactivate(2).deactivate(3).deactivate(4);}
 if(control_motion_1==1){checkbox_control_m1.activate(1).deactivate(0).deactivate(2).deactivate(3).deactivate(4);}
 if(control_motion_1==2){checkbox_control_m1.activate(2).deactivate(1).deactivate(0).deactivate(3).deactivate(4);}
 if(control_motion_1==3){checkbox_control_m1.activate(3).deactivate(1).deactivate(2).deactivate(0).deactivate(4);}
 if(control_motion_1==4){checkbox_control_m1.activate(4).deactivate(1).deactivate(2).deactivate(0).deactivate(3);}
  
  if(control_motion_2==0){checkbox_control_m2.activate(0).deactivate(1).deactivate(2).deactivate(3).deactivate(4);}
 if(control_motion_2==1){checkbox_control_m2.activate(1).deactivate(0).deactivate(2).deactivate(3).deactivate(4);}
 if(control_motion_2==2){checkbox_control_m2.activate(2).deactivate(1).deactivate(0).deactivate(3).deactivate(4);}
 if(control_motion_2==3){checkbox_control_m2.activate(3).deactivate(1).deactivate(2).deactivate(0).deactivate(4);}
 if(control_motion_2==4){checkbox_control_m2.activate(4).deactivate(1).deactivate(2).deactivate(0).deactivate(3);}

}









public void controlEvent(ControlEvent theEvent)
{



  if (theEvent.isController())
  {
    if (theEvent.name()=="portComList") {
      select_index0 =true;
      InitSerial((int)(theEvent.controller().getValue()));
    }// initialize the serial port selected

    if (theEvent.name()=="baudList") {
      select_index1 =true;
      if (baudListbox.getValue() == 0) {
        GUI_BaudRate =4800;
      }
      if (baudListbox.getValue() == 1) {
        GUI_BaudRate =9600;
      }
      if (baudListbox.getValue() == 2) {
        GUI_BaudRate =14400;
      }
      if (baudListbox.getValue() == 3) {
        GUI_BaudRate =19200;
      }
      if (baudListbox.getValue() == 4) {
        GUI_BaudRate =28800;
      }
      if (baudListbox.getValue() == 5) {
        GUI_BaudRate =38400;
      }
      if (baudListbox.getValue() == 6) {
        GUI_BaudRate =57600;
      }
      if (baudListbox.getValue() == 7) {
        GUI_BaudRate =115200;
      }
      if (baudListbox.getValue() == 8) {
        GUI_BaudRate =250000;
      }
    }  // Set GUI_BaudRate to selected.
  }
  
  /////////////////////
    if (theEvent.isFrom(checkbox_speed_m1)) {
    
   if (checkbox_speed_m1.getArrayValue()[0]==1){temp_memo = 1;}
   if (checkbox_speed_m1.getArrayValue()[1]==1){temp_memo = 2;}
   if (checkbox_speed_m1.getArrayValue()[2]==1){temp_memo = 3;}
   if (checkbox_speed_m1.getArrayValue()[3]==1){temp_memo = 4;}
     if(temp_memo==1){idou_bunkai_m1 = 0.01;}
      if(temp_memo==2){idou_bunkai_m1 = 0.1;}
      if(temp_memo==3){idou_bunkai_m1 = 1;}
      if(temp_memo==4){idou_bunkai_m1 = 10;}
      
   check_speed_bunkai_1();
  }
      if (theEvent.isFrom(checkbox_speed_m2)) {
    
   // println(checkbox_speed_m1.getArrayValue());
  //  for (int i=0;i<checkbox_speed_m2.getArrayValue().length;i++) {
      if(checkbox_speed_m2.getArrayValue()[0]==1){idou_bunkai_m2 = 0.01;}
      if(checkbox_speed_m2.getArrayValue()[1]==1){idou_bunkai_m2 = 0.1;}
      if(checkbox_speed_m2.getArrayValue()[2]==1){idou_bunkai_m2 = 1;}
      if(checkbox_speed_m2.getArrayValue()[3]==1){idou_bunkai_m2 = 10;}
      
  //  }
  }
  if (theEvent.isFrom(checkbox_control_m1)) {
    if (checkbox_control_m1.getArrayValue()[0]==1){temp_control1 = 0;}
   if (checkbox_control_m1.getArrayValue()[1]==1){temp_control1 = 1;}
   if (checkbox_control_m1.getArrayValue()[2]==1){temp_control1 = 2;}
   if (checkbox_control_m1.getArrayValue()[3]==1){temp_control1 = 3;}
   if (checkbox_control_m1.getArrayValue()[4]==1){temp_control1 = 4;}
   
   
  }
  if (theEvent.isFrom(checkbox_control_m2)) {
    if (checkbox_control_m2.getArrayValue()[0]==1){temp_control2 = 0;}
   if (checkbox_control_m2.getArrayValue()[1]==1){temp_control2 = 1;}
   if (checkbox_control_m2.getArrayValue()[2]==1){temp_control2 = 2;}
   if (checkbox_control_m2.getArrayValue()[3]==1){temp_control2 = 3;}
   if (checkbox_control_m2.getArrayValue()[4]==1){temp_control2 = 4;}
   
   
  }
  
}
