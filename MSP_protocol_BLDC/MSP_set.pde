
 public void bt_save_para(){//DATA 8 bit MODE
 
               
              set_run_mode[0] = int(number_runmode.getValue());
              set_run_mode[1] = int(number_error_mode.getValue());
              set_run_mode[2] = int(number_motor.getValue());
              set_run_mode[3] = int(current_motor_num.getValue());
              set_run_mode[4] = int(Resolution_m1.getValue());
              set_run_mode[5] = int(Resolution_m2.getValue());
              set_run_mode[6] = int(Pole_Pairs_m1.getValue());
              set_run_mode[7] = int(Pole_Pairs_m2.getValue());
              set_run_mode[8] = int(temp_control1);
              set_run_mode[9] = int(temp_control2);
              
              payload = new ArrayList<Character>();
              payload.add(char (set_run_mode[0] ));
              payload.add(char (set_run_mode[1] ));
              payload.add(char (set_run_mode[2] ));
              payload.add(char (set_run_mode[3] ));
              payload.add(char (set_run_mode[4] ));
              payload.add(char (set_run_mode[5] ));
              payload.add(char (set_run_mode[6] ));
              payload.add(char (set_run_mode[7] ));
              payload.add(char (set_run_mode[8] ));
              payload.add(char (set_run_mode[9] ));
              
              if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_MODE_SET,payload.toArray( new Character[payload.size()]) ));
 
 //print(set_run_mode[0]);print(set_run_mode[1]);print(set_run_mode[2]);print(set_run_mode[3]);print(set_run_mode[4]);println(set_run_mode[5]);
 }
 
 public void bt_save_para1(){
   
   payload = new ArrayList<Character>();
   payload.add(char (3));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
 }
 public void bt_save_para2(){
   payload = new ArrayList<Character>();
   payload.add(char (4));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
 }
 
 public void save_m1_pos_bt(){
   
   payload = new ArrayList<Character>();
   
   int nn = Float.floatToIntBits(pos_m1_p1.getValue()); 
                  payload.add(char( nn&0xff ));
                  payload.add(char( (nn >> 8) & 0xff ));
                  payload.add(char( (nn >> 16) & 0xFF ));
                  payload.add(char( (nn >> 24) & 0xFF ));
   int nn1 = Float.floatToIntBits(pos_m1_p2.getValue()); 
                  payload.add(char( nn1&0xff ));
                  payload.add(char( (nn1 >> 8) & 0xff ));
                  payload.add(char( (nn1 >> 16) & 0xFF ));
                  payload.add(char( (nn1 >> 24) & 0xFF ));
                  
                  payload.add(char (int(vel_m1_p1.getValue()) % 256) );
                  payload.add(char (int(vel_m1_p1.getValue()) / 256)  );
                  payload.add(char (int(vel_m1_p2.getValue()) % 256) );
                  payload.add(char (int(vel_m1_p2.getValue()) / 256)  );
       //
                  payload.add(char (int(accel_m1.getValue()) % 256) );
                  payload.add(char (int(accel_m1.getValue()) / 256)  );
                  payload.add(char (int(deccel_m1.getValue()) % 256) );
                  payload.add(char (int(deccel_m1.getValue()) / 256)  );
              
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DATAPOS1_SET,payload.toArray( new Character[payload.size()]) ));
   delay(20);
   //
   payload = new ArrayList<Character>();
   payload.add(char (1));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
 println("ok");
 }
 public void save_m2_pos_bt(){
   payload = new ArrayList<Character>();
   
   int nn2 = Float.floatToIntBits(pos_m2_p1.getValue()); 
                  payload.add(char( nn2&0xff ));
                  payload.add(char( (nn2 >> 8) & 0xff ));
                  payload.add(char( (nn2 >> 16) & 0xFF ));
                  payload.add(char( (nn2 >> 24) & 0xFF ));
   int nn3 = Float.floatToIntBits(pos_m2_p2.getValue()); 
                  payload.add(char( nn3&0xff ));
                  payload.add(char( (nn3 >> 8) & 0xff ));
                  payload.add(char( (nn3 >> 16) & 0xFF ));
                  payload.add(char( (nn3 >> 24) & 0xFF ));
                  
                  payload.add(char (int(vel_m2_p1.getValue()) % 256) );
                  payload.add(char (int(vel_m2_p1.getValue()) / 256)  );
                  payload.add(char (int(vel_m2_p2.getValue()) % 256) );
                  payload.add(char (int(vel_m2_p2.getValue()) / 256)  );
       //
                  payload.add(char (int(accel_m2.getValue()) % 256) );
                  payload.add(char (int(accel_m2.getValue()) / 256)  );
                  payload.add(char (int(deccel_m2.getValue()) % 256) );
                  payload.add(char (int(deccel_m2.getValue()) / 256)  );
              
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DATAPOS2_SET,payload.toArray( new Character[payload.size()]) ));
   //
   delay(20);
   payload = new ArrayList<Character>();
   payload.add(char (2));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
 }
 
 
 
 public void bt_save_para1_event(){
   
   payload = new ArrayList<Character>();
   
   int nn4 = Float.floatToIntBits(P_pos_1.getValue()); 
                  payload.add(char( nn4&0xff ));
                  payload.add(char( (nn4 >> 8) & 0xff ));
                  payload.add(char( (nn4 >> 16) & 0xFF ));
                  payload.add(char( (nn4 >> 24) & 0xFF ));
   int nn5 = Float.floatToIntBits(P_vel_1.getValue()); 
                  payload.add(char( nn5&0xff ));
                  payload.add(char( (nn5 >> 8) & 0xff ));
                  payload.add(char( (nn5 >> 16) & 0xFF ));
                  payload.add(char( (nn5 >> 24) & 0xFF ));
   int nn6 = Float.floatToIntBits(I_vel_1.getValue()); 
                  payload.add(char( nn6&0xff ));
                  payload.add(char( (nn6 >> 8) & 0xff ));
                  payload.add(char( (nn6 >> 16) & 0xFF ));
                  payload.add(char( (nn6 >> 24) & 0xFF ));
   int nn7 = Float.floatToIntBits(D_vel_1.getValue()); 
                  payload.add(char( nn7&0xff ));
                  payload.add(char( (nn7 >> 8) & 0xff ));
                  payload.add(char( (nn7 >> 16) & 0xFF ));
                  payload.add(char( (nn7 >> 24) & 0xFF ));
   int nn8 = Float.floatToIntBits(volin_1.getValue()); 
                  payload.add(char( nn8&0xff ));
                  payload.add(char( (nn8 >> 8) & 0xff ));
                  payload.add(char( (nn8 >> 16) & 0xFF ));
                  payload.add(char( (nn8 >> 24) & 0xFF ));
   int nn9 = Float.floatToIntBits(vol_limit1.getValue()); 
                  payload.add(char( nn9&0xff ));
                  payload.add(char( (nn9 >> 8) & 0xff ));
                  payload.add(char( (nn9 >> 16) & 0xFF ));
                  payload.add(char( (nn9 >> 24) & 0xFF ));
                  
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_PARASAVE1_SET,payload.toArray( new Character[payload.size()]) ));
   //
   delay(20);
   payload = new ArrayList<Character>();
   payload.add(char (3));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
   
   
 }
 
 public void bt_save_para2_event(){
   payload = new ArrayList<Character>();
   
   int nn10 = Float.floatToIntBits(P_pos_2.getValue()); 
                  payload.add(char( nn10&0xff ));
                  payload.add(char( (nn10 >> 8) & 0xff ));
                  payload.add(char( (nn10 >> 16) & 0xFF ));
                  payload.add(char( (nn10 >> 24) & 0xFF ));
   int nn11 = Float.floatToIntBits(P_vel_2.getValue()); 
                  payload.add(char( nn11&0xff ));
                  payload.add(char( (nn11 >> 8) & 0xff ));
                  payload.add(char( (nn11 >> 16) & 0xFF ));
                  payload.add(char( (nn11 >> 24) & 0xFF ));
   int nn12 = Float.floatToIntBits(I_vel_2.getValue()); 
                  payload.add(char( nn12&0xff ));
                  payload.add(char( (nn12 >> 8) & 0xff ));
                  payload.add(char( (nn12 >> 16) & 0xFF ));
                  payload.add(char( (nn12 >> 24) & 0xFF ));
   int nn13 = Float.floatToIntBits(D_vel_2.getValue()); 
                  payload.add(char( nn13&0xff ));
                  payload.add(char( (nn13 >> 8) & 0xff ));
                  payload.add(char( (nn13 >> 16) & 0xFF ));
                  payload.add(char( (nn13 >> 24) & 0xFF ));
   int nn14 = Float.floatToIntBits(volin_2.getValue()); 
                  payload.add(char( nn14&0xff ));
                  payload.add(char( (nn14 >> 8) & 0xff ));
                  payload.add(char( (nn14 >> 16) & 0xFF ));
                  payload.add(char( (nn14 >> 24) & 0xFF ));
   int nn15 = Float.floatToIntBits(vol_limit2.getValue()); 
                  payload.add(char( nn15&0xff ));
                  payload.add(char( (nn15 >> 8) & 0xff ));
                  payload.add(char( (nn15 >> 16) & 0xFF ));
                  payload.add(char( (nn15 >> 24) & 0xFF ));
                  
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_PARASAVE2_SET,payload.toArray( new Character[payload.size()]) ));
   //
   delay(20);
   payload = new ArrayList<Character>();
   payload.add(char (4));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_SAVE_SET,payload.toArray( new Character[payload.size()]) ));
   
   
 }
 
 
 public void button_run_pos_m1_(){
              
  
   
                   
                  
                  payload = new ArrayList<Character>();
                  payload.add(char (int(SET_speed_1.getValue()) % 256) );
                  payload.add(char (int(SET_speed_1.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_1.getValue()) % 256) );
                  payload.add(char (int(SET_acc_1.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_1.getValue()) % 256) );
                  payload.add(char (int(SET_dec_1.getValue()) / 256)  );
                  delay(5);
                  int nn100 = Float.floatToIntBits(round(100*(SET_pos_1.getValue()+ofset_O_position_1 ))); 
                  payload.add(char( nn100&0xff ));
                  payload.add(char( (nn100 >> 8) & 0xff ));
                  payload.add(char( (nn100 >> 16) & 0xFF ));
                  payload.add(char( (nn100 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_1_SET,payload.toArray( new Character[payload.size()]) ));              
}
 
 
  public void button_run_pos_m2_(){
   payload = new ArrayList<Character>();
   
   int nn101 = Float.floatToIntBits(round(100*(SET_pos_2.getValue()+ofset_O_position_2))); 
                  
                  
                  payload.add(char (int(SET_speed_2.getValue()) % 256) );
                  payload.add(char (int(SET_speed_2.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_2.getValue()) % 256) );
                  payload.add(char (int(SET_acc_2.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_2.getValue()) % 256) );
                  payload.add(char (int(SET_dec_2.getValue()) / 256)  );
                  delay(5);
                  payload.add(char( nn101&0xff ));
                  payload.add(char( (nn101 >> 8) & 0xff ));
                  payload.add(char( (nn101 >> 16) & 0xFF ));
                  payload.add(char( (nn101 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_2_SET,payload.toArray( new Character[payload.size()]) ));              
  
  
  
}
 
 public void bt_motor1_cw_(){
              
              payload = new ArrayList<Character>();
   position_idou_motor1=value_ichi_m1_after+idou_bunkai_m1;
   int nn101 = Float.floatToIntBits(round(100*position_idou_motor1)); 
                  
                  println(position_idou_motor1);
                  
                  payload.add(char (int(SET_speed_1.getValue()) % 256) );
                  payload.add(char (int(SET_speed_1.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_1.getValue()) % 256) );
                  payload.add(char (int(SET_acc_1.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_1.getValue()) % 256) );
                  payload.add(char (int(SET_dec_1.getValue()) / 256)  );
                  delay(5);
                  payload.add(char( nn101&0xff ));
                  payload.add(char( (nn101 >> 8) & 0xff ));
                  payload.add(char( (nn101 >> 16) & 0xFF ));
                  payload.add(char( (nn101 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_1_SET,payload.toArray( new Character[payload.size()]) ));              
}
 
  public void bt_motor1_ccw_(){
              
              payload = new ArrayList<Character>();
              position_idou_motor1=value_ichi_m1_after-idou_bunkai_m1;
              println(position_idou_motor1);
              int nn101 = Float.floatToIntBits(100*position_idou_motor1); 
                  
                  
                  payload.add(char (int(SET_speed_1.getValue()) % 256) );
                  payload.add(char (int(SET_speed_1.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_1.getValue()) % 256) );
                  payload.add(char (int(SET_acc_1.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_1.getValue()) % 256) );
                  payload.add(char (int(SET_dec_1.getValue()) / 256)  );
                  delay(5);
                  payload.add(char( nn101&0xff ));
                  payload.add(char( (nn101 >> 8) & 0xff ));
                  payload.add(char( (nn101 >> 16) & 0xFF ));
                  payload.add(char( (nn101 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_1_SET,payload.toArray( new Character[payload.size()]) ));              
}
 
 
 
 
 
 
 
 public void bt_motor5_cw_(){
              
              payload = new ArrayList<Character>();
   position_idou_motor2=value_ichi_m2_after+idou_bunkai_m2;
   int nn101 = Float.floatToIntBits(round(100*position_idou_motor2)); 
                  
                  
                  payload.add(char (int(SET_speed_2.getValue()) % 256) );
                  payload.add(char (int(SET_speed_2.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_2.getValue()) % 256) );
                  payload.add(char (int(SET_acc_2.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_2.getValue()) % 256) );
                  payload.add(char (int(SET_dec_2.getValue()) / 256)  );
                  delay(5);
                  payload.add(char( nn101&0xff ));
                  payload.add(char( (nn101 >> 8) & 0xff ));
                  payload.add(char( (nn101 >> 16) & 0xFF ));
                  payload.add(char( (nn101 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_2_SET,payload.toArray( new Character[payload.size()]) ));              
}
  public void bt_motor5_ccw_(){
              
              payload = new ArrayList<Character>();
   position_idou_motor2=value_ichi_m2_after-idou_bunkai_m2;
   int nn101 = Float.floatToIntBits(round(100*position_idou_motor2)); 
                  
                  
                  payload.add(char (int(SET_speed_2.getValue()) % 256) );
                  payload.add(char (int(SET_speed_2.getValue()) / 256)  );
                  payload.add(char (int(SET_acc_2.getValue()) % 256) );
                  payload.add(char (int(SET_acc_2.getValue()) / 256)  );
                  payload.add(char (int(SET_dec_2.getValue()) % 256) );
                  payload.add(char (int(SET_dec_2.getValue()) / 256)  );
                  delay(5);
                  payload.add(char( nn101&0xff ));
                  payload.add(char( (nn101 >> 8) & 0xff ));
                  payload.add(char( (nn101 >> 16) & 0xFF ));
                  payload.add(char( (nn101 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_IDOU_2_SET,payload.toArray( new Character[payload.size()]) ));              
}
 
 void pos_m1_p1_event(){
   if (read_data_on==true){  
    payload = new ArrayList<Character>();
   int nn22 = Float.floatToIntBits(pos_m1_p1.getValue()); 
                  payload.add(char( nn22&0xff ));
                  payload.add(char( (nn22 >> 8) & 0xff ));
                  payload.add(char( (nn22 >> 16) & 0xFF ));
                  payload.add(char( (nn22 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_POS11_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 void pos_m1_p2_event(float ichi){
   
 if (read_data_on==true){  
    
    
    payload = new ArrayList<Character>();
   //int nn23 = Float.floatToIntBits(pos_m1_p2.getValue()); 
   int nn23 = Float.floatToIntBits(ichi); 
                  payload.add(char( nn23&0xff ));
                  payload.add(char( (nn23 >> 8) & 0xff ));
                  payload.add(char( (nn23 >> 16) & 0xFF ));
                  payload.add(char( (nn23 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_POS12_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 void vel_m1_p1_event(){
   if (read_data_on==true){  
    payload = new ArrayList<Character>();
                  payload.add(char (int(vel_m1_p1.getValue()) % 256) );
                  payload.add(char (int(vel_m1_p1.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_VEL11_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 void vel_m1_p2_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(vel_m1_p2.getValue()) % 256) );
                  payload.add(char (int(vel_m1_p2.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_VEL12_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 void accel_m1_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(accel_m1.getValue()) % 256) );
                  payload.add(char (int(accel_m1.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_ACCEL1_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 void deccel_m1_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(deccel_m1.getValue()) % 256) );
                  payload.add(char (int(deccel_m1.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DECCEL1_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 /////////motor 2
  void pos_m2_p1_event(){
    if (read_data_on==true){  
    payload = new ArrayList<Character>();
   int nn24 = Float.floatToIntBits(pos_m2_p1.getValue()); 
                  payload.add(char( nn24&0xff ));
                  payload.add(char( (nn24 >> 8) & 0xff ));
                  payload.add(char( (nn24 >> 16) & 0xFF ));
                  payload.add(char( (nn24 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_POS21_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 void pos_m2_p2_event(){
   if (read_data_on==true){  
    payload = new ArrayList<Character>();
   int nn25 = Float.floatToIntBits(pos_m2_p2.getValue()); 
                  payload.add(char( nn25&0xff ));
                  payload.add(char( (nn25 >> 8) & 0xff ));
                  payload.add(char( (nn25 >> 16) & 0xFF ));
                  payload.add(char( (nn25 >> 24) & 0xFF ));
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_POS22_SET,payload.toArray( new Character[payload.size()]) ));  
    
 }}
 
 void vel_m2_p1_event(){
   if (read_data_on==true){  
    payload = new ArrayList<Character>();
                  payload.add(char (int(vel_m2_p1.getValue()) % 256) );
                  payload.add(char (int(vel_m2_p1.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_VEL21_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 void vel_m2_p2_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(vel_m2_p2.getValue()) % 256) );
                  payload.add(char (int(vel_m2_p2.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_VEL22_SET,payload.toArray( new Character[payload.size()]) ));  
    
    
    
    
 }}
 void accel_m2_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(accel_m2.getValue()) % 256) );
                  payload.add(char (int(accel_m2.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_ACCEL2_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 void deccel_m2_event(){
   if (read_data_on==true){  
   payload = new ArrayList<Character>();
                  payload.add(char (int(deccel_m2.getValue()) % 256) );
                  payload.add(char (int(deccel_m2.getValue()) / 256)  );
                 
    if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DECCEL2_SET,payload.toArray( new Character[payload.size()]) ));  
 }}
 
 
 ///////////
 void GENTEN_1_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (5));//code cmd
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
 void GENTEN_2_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (10));//cmd
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
 
 
 
 void POS_1_M1_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (1));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
 void POS_2_M1_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (2));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
  void POS_1_M2_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (11));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
 void POS_2_M2_RUN_(){
   payload = new ArrayList<Character>();
   payload.add(char (12));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_RUN_SET,payload.toArray( new Character[payload.size()]) ));
 }
 
 
 ///////////////////////////////////check box speed 
 void check_control_m1() {
 
}
  void check_speed_bunkai_1() {
 
 //if(temp_memo==1){checkbox_speed_m1.activate(0).deactivate(1).deactivate(2).deactivate(3);}
 //if(temp_memo==2){checkbox_speed_m1.activate(1).deactivate(0).deactivate(2).deactivate(3);}
 //if(temp_memo==3){checkbox_speed_m1.activate(2).deactivate(1).deactivate(0).deactivate(3);}
 //if(temp_memo==4){checkbox_speed_m1.activate(4).deactivate(1).deactivate(2).deactivate(0);}
 
      
  
   checkbox_speed_m1.setArrayValue(0,0);
   checkbox_speed_m1.setArrayValue(1,0);
   checkbox_speed_m1.setArrayValue(2,0);
   checkbox_speed_m1.setArrayValue(3,0);
  
  temp_memo=0;
  
     // println(temp_memo);
 
}
 
 
 
  void check_speed2(float[] a) {
  if (checkbox_speed_m2.getArrayValue()[0]==1){temp_memo = 1;}
   if (checkbox_speed_m2.getArrayValue()[1]==1){temp_memo = 2;}
   if (checkbox_speed_m2.getArrayValue()[2]==1){temp_memo = 3;}
   if (checkbox_speed_m2.getArrayValue()[3]==1){temp_memo = 4;}
   
   
   
 if(temp_memo==1){checkbox_speed_m2.activate(0).deactivate(1).deactivate(2).deactivate(3);}
 if(temp_memo==2){checkbox_speed_m2.activate(1).deactivate(0).deactivate(2).deactivate(3);}
 if(temp_memo==3){checkbox_speed_m2.activate(2).deactivate(1).deactivate(0).deactivate(3);}
 if(temp_memo==4){checkbox_speed_m2.activate(4).deactivate(1).deactivate(2).deactivate(0);}
 
      if(temp_memo==1){idou_bunkai_m2 = 0.01;}
      if(temp_memo==2){idou_bunkai_m2 = 0.1;}
      if(temp_memo==3){idou_bunkai_m2 = 1;}
      if(temp_memo==4){idou_bunkai_m2 = 10;}
  
   checkbox_speed_m2.setArrayValue(0,0);
   checkbox_speed_m2.setArrayValue(1,0);
   checkbox_speed_m2.setArrayValue(2,0);
   checkbox_speed_m2.setArrayValue(3,0);
  
  temp_memo=0;
  
      println(temp_memo);
}
 
 
 public void bt_motor1_zero_(){
 ofset_O_position_1=value_ichi_m1_after;
 
}
 
public void bt_motor5_zero_ (){
   ofset_O_position_2=value_ichi_m2_after;
}
 
 
 
 
 
 
 void motor_1_dis_(){
   if (disable_m1.getValue() == 1){
     println("E");
     disable_m1.setColorBackground(color(0,255,0));
   payload = new ArrayList<Character>();
   payload.add(char (1));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DISABLE_MOTOR_SET,payload.toArray( new Character[payload.size()]) ));
   }
   if (disable_m1.getValue() == 0){
     println("D");
     disable_m1.setColorActive(color(255,0,0));
   payload = new ArrayList<Character>();
   payload.add(char (2));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DISABLE_MOTOR_SET,payload.toArray( new Character[payload.size()]) ));
   }
 }
 void motor_2_dis_(){
  if (disable_m2.getValue() == 1){
     println("E");
     disable_m2.setColorBackground(color(255,0,0));
   payload = new ArrayList<Character>();
   payload.add(char (3));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DISABLE_MOTOR_SET,payload.toArray( new Character[payload.size()]) ));
   }
   if (disable_m2.getValue() == 0){
     println("D");
     disable_m1.setColorActive(color(0,255,0));
   payload = new ArrayList<Character>();
   payload.add(char (4));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_DISABLE_MOTOR_SET,payload.toArray( new Character[payload.size()]) ));
   }
 }
 
 
 void bt_reset_error(){
    payload = new ArrayList<Character>();
   payload.add(char (1));
   if(Serial_activate == true)sendRequestMSP(requestMSP(MSP_MOTOR_ERROR_SET,payload.toArray( new Character[payload.size()]) ));
   
 }
 
 
 
 
 
 
 
 
 
 /////////////////////////////////////
 
 void InitSerial(int portValue) {
    
  if (portValue <= commListMax) {
    portPos = Serial.list()[int(portValue)];
    txtlblWhichcom.setValue("COM = " + shortifyPortName(portPos, 8));
  //  
  } else {
    txtlblWhichcom.setValue("Comm Closed");
    txtlblcom_connect.setValue("Disconnected");
    init_com=0;
    buttonSTART.setColorBackground(red_);buttonSTOP.setColorBackground(red_);
    commListbox.setColorBackground(red_);buttonSETTING.setColorBackground(red_);

  }
}

//void InitBaudRate(int baudrate){
    
//   // GUI_BaudRate = baudListbox.list()[int(baudrate)];
//    GUI_BaudRate = baudListbox.getGroup().getValue();
//  //  
  
//}


public void bREFRESH(){
  
    commListbox.clear();
    for(int i=0;i<Serial.list().length;i++) {
    String pn = shortifyPortName(Serial.list()[i], 13);
    //if( pn.startsWith("/dev/ttyUSB") ) {
      if (pn.length() >0 ) commListbox.addItem(pn,i); // addItem(name,value)
      commListMax = i;
}
}

public void bSTART() {
  if (select_index0 == true && select_index1 == true)
  {
    myPort = new Serial(this, portPos, GUI_BaudRate);
    print(portPos);print("\t");print(GUI_BaudRate);print("\t");print(parity);print("\t");print(dataBits);print("\t");println(stopBits);
    
    init_com=1;
    if (myPort.active() == true ){ Serial_activate = true;}else {Serial_activate = false;return;}
    txtlblWhichcom.setValue("Comm Opened");
    txtlblcom_connect.setValue("Connected");
    buttonSTART.setColorBackground(green_);
    buttonSTOP.setColorBackground(green_);
    commListbox.setColorBackground(green_);
    baudListbox.setColorBackground(green_);
    //myPort.buffer(256);
    btnQConnect.hide();
    btnRefresh.hide();
}
else txtlblcom_connect.setValue("Not Select Com/Baud");
}

public void bSTOP() {
    if (init_com==1){
    myPort.stop();
    txtlblWhichcom.setValue("Comm Closed");
    txtlblcom_connect.setValue("Disconnected");
    buttonSTART.setColorBackground(red_);
    buttonSTOP.setColorBackground(red_);
    commListbox.setColorBackground(red_);
    baudListbox.setColorBackground(red_);
    btnQConnect.show();
    myPort.clear();
    btnRefresh.show();
}
}

public void bSEND(){
  String data,dt;
  data = cp5.get(Textfield.class,"input_data").getText();
  dt = str(hour())+":"+str(minute())+":"+str(second())+">>"+data;
 if (Serial_activate == true ){
   myPort.write(data); 
   
   //myTextarea.setText(dt);
   myTextarea.setColor(0xffffffff);
   myTextarea.append(dt,255);
  }
  else txtlblcom_connect.setValue("COM not Open");
}
