
 public void motor_test_gra(){
 
     Group G_analog_read2 = cp5.addGroup("MOTOR_MODE_1_IO_POSITION");
                    G_analog_read2.setPosition(630,40);
                    G_analog_read2.setFont(font_medium);
                    G_analog_read2.setBarHeight(15);
                    G_analog_read2.setBackgroundHeight(500);
                    G_analog_read2.setBackgroundColor(color(255,50));
                    G_analog_read2.setWidth(610);
                    G_analog_read2.moveTo("default");
   ///////////////////////////////////////////////MOTOR 1 set/////////////////////////////   
 m1_p1_set = cp5.addTextlabel("m1_p1_set");
                    m1_p1_set.setText("<position>_M1_set_P1:");
                    m1_p1_set.setPosition(5,20);
                    m1_p1_set.setColorValue(0xffffff00);
                    m1_p1_set.setFont(createFont("Georgia",15));
                    m1_p1_set.setGroup(G_analog_read2);
                    
                    
  m1_p2_set = cp5.addTextlabel("m1_p2_set");
                    m1_p2_set.setText("<position>_M1_set_P2:");
                    m1_p2_set.setPosition(5,70);
                    m1_p2_set.setColorValue(0xffffff00);
                    m1_p2_set.setFont(createFont("Georgia",15));
                    m1_p2_set.setGroup(G_analog_read2);
                                                      
 m1_v1_set = cp5.addTextlabel("m1_v1_set");
                    m1_v1_set.setText("<speed>_M1_set_P1:");
                    m1_v1_set.setPosition(5,120);
                    m1_v1_set.setColorValue(0xffffff00);
                    m1_v1_set.setFont(createFont("Georgia",15));
                    m1_v1_set.setGroup(G_analog_read2);
  m1_v2_set = cp5.addTextlabel("m1_v2_set");
                    m1_v2_set.setText("<speed>_M1_set_P2:");
                    m1_v2_set.setPosition(5,170);
                    m1_v2_set.setColorValue(0xffffff00);
                    m1_v2_set.setFont(createFont("Georgia",15));
                    m1_v2_set.setGroup(G_analog_read2);
     
  
  accel1_text = cp5.addTextlabel("accel1_text");
                    accel1_text.setText("<accel>_M1_set:");
                    accel1_text.setPosition(5,220);
                    accel1_text.setColorValue(0xffffff00);
                    accel1_text.setFont(createFont("Georgia",15));
                    accel1_text.setGroup(G_analog_read2);
  deccel1_text = cp5.addTextlabel("deccel1_text");
                    deccel1_text.setText("<deccel>_M1_set:");
                    deccel1_text.setPosition(5,270);
                    deccel1_text.setColorValue(0xffffff00);
                    deccel1_text.setFont(createFont("Georgia",15));
                    deccel1_text.setGroup(G_analog_read2);
 
  
  
  
  
  /////////////////////////////
  pos_m1_p1 =   cp5.addNumberbox("pos_m1_p1_event").setPosition(180,15);
                     pos_m1_p1.setSize(60,30);
                     pos_m1_p1.setScrollSensitivity(0.01);
                     pos_m1_p1.setValue(0);
                     pos_m1_p1.setGroup(G_analog_read2);
                     pos_m1_p1.setFont(font_medium).setLabel("").setMin(-100).setMax(100); 
                     
  pos_m1_p2 =   cp5.addNumberbox("pos_m1_p2_event").setPosition(180,65);
                     pos_m1_p2.setSize(60,30);
                     pos_m1_p2.setScrollSensitivity(0.01);
                     pos_m1_p2.setValue(0);
                     pos_m1_p2.setGroup(G_analog_read2);   
                     pos_m1_p2.setFont(font_medium).setLabel("").setMin(-100).setMax(100); 
                     
  vel_m1_p1 =   cp5.addNumberbox("vel_m1_p1_event").setPosition(180,115);
                     vel_m1_p1.setSize(60,30);
                     vel_m1_p1.setScrollSensitivity(10);
                     vel_m1_p1.setValue(0);
                     vel_m1_p1.setGroup(G_analog_read2);
                     vel_m1_p1.setFont(font_medium).setLabel("").setMin(0);   
   vel_m1_p2 =   cp5.addNumberbox("vel_m1_p2_event").setPosition(180,165);
                     vel_m1_p2.setSize(60,30);
                     vel_m1_p2.setScrollSensitivity(10);
                     vel_m1_p2.setValue(0);
                     vel_m1_p2.setGroup(G_analog_read2);
                     vel_m1_p2.setFont(font_medium).setLabel("").setMin(0);                   
 
                     
  accel_m1   =   cp5.addNumberbox("accel_m1_event").setPosition(180,215);
                     accel_m1.setSize(60,30);
                     accel_m1.setScrollSensitivity(10);
                     accel_m1.setValue(0);
                     accel_m1.setGroup(G_analog_read2);
                     accel_m1.setFont(font_medium).setLabel("").setMin(0);                
   deccel_m1   =   cp5.addNumberbox("deccel_m1_event").setPosition(180,265);
                     deccel_m1.setSize(60,30);
                     deccel_m1.setScrollSensitivity(10);
                     deccel_m1.setValue(0);
                     deccel_m1.setGroup(G_analog_read2);
                     deccel_m1.setFont(font_medium).setLabel("SET").setMin(0); 
                     
                     
                     ///
  cur_pos_m1_p1 =   cp5.addNumberbox("cur_pos_m1_p1").setPosition(245,15);
                     cur_pos_m1_p1.setSize(60,30);
                     cur_pos_m1_p1.setScrollSensitivity(0.01);
                     cur_pos_m1_p1.setValue(0);
                     cur_pos_m1_p1.setGroup(G_analog_read2);
                     cur_pos_m1_p1.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  cur_pos_m1_p2 =   cp5.addNumberbox("cur_pos_m1_p2").setPosition(245,65);
                     cur_pos_m1_p2.setSize(60,30);
                     cur_pos_m1_p2.setScrollSensitivity(0.01);
                     cur_pos_m1_p2.setValue(0);
                     cur_pos_m1_p2.setGroup(G_analog_read2);   
                     cur_pos_m1_p2.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
 
  cur_vel_m1_p1 =   cp5.addNumberbox("cur_vel_m1_p1").setPosition(245,115);
                     cur_vel_m1_p1.setSize(60,30);
                     cur_vel_m1_p1.setScrollSensitivity(10);
                     cur_vel_m1_p1.setValue(0);
                     cur_vel_m1_p1.setGroup(G_analog_read2);
                     cur_vel_m1_p1.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);
   cur_vel_m1_p2 =   cp5.addNumberbox("cur_vel_m1_p2").setPosition(245,165);
                     cur_vel_m1_p2.setSize(60,30);
                     cur_vel_m1_p2.setScrollSensitivity(10);
                     cur_vel_m1_p2.setValue(0);
                     cur_vel_m1_p2.setGroup(G_analog_read2);
                     cur_vel_m1_p2.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);                
 
                     
  cur_accel_m1   =   cp5.addNumberbox("cur_accel_m1").setPosition(245,215);
                     cur_accel_m1.setSize(60,30);
                     cur_accel_m1.setScrollSensitivity(10);
                     cur_accel_m1.setValue(0);
                     cur_accel_m1.setGroup(G_analog_read2);
                     cur_accel_m1.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);          
   cur_deccel_m1   =   cp5.addNumberbox("cur_deccel_m1").setPosition(245,265);
                     cur_deccel_m1.setSize(60,30);
                     cur_deccel_m1.setScrollSensitivity(10);
                     cur_deccel_m1.setValue(0);
                     cur_deccel_m1.setGroup(G_analog_read2);
                     cur_deccel_m1.setFont(font_medium).setLabel("NOW").setMin(0).setLock(true).setColorBackground(green_);
                     
  ///////////////////////////////////////////////MOTOR 2 set/////////////////////////////                   
                     
                     
 m2_p1_set = cp5.addTextlabel("m2_p1_set");
                    m2_p1_set.setText("<position>_M2_set_P1:");
                    m2_p1_set.setPosition(310,20);
                    m2_p1_set.setColorValue(0xffffff00);
                    m2_p1_set.setFont(createFont("Georgia",15));
                    m2_p1_set.setGroup(G_analog_read2);
                    
 m2_p2_set = cp5.addTextlabel("m2_p2_set");
                    m2_p2_set.setText("<position>_M2_set_P2:");
                    m2_p2_set.setPosition(310,70);
                    m2_p2_set.setColorValue(0xffffff00);
                    m2_p2_set.setFont(createFont("Georgia",15));
                    m2_p2_set.setGroup(G_analog_read2);                  
    m2_v1_set = cp5.addTextlabel("m2_v1_set");
                    m2_v1_set.setText("<speed>_M2_set_P1:");
                    m2_v1_set.setPosition(310,120);
                    m2_v1_set.setColorValue(0xffffff00);
                    m2_v1_set.setFont(createFont("Georgia",15));
                    m2_v1_set.setGroup(G_analog_read2);       
 m2_v2_set = cp5.addTextlabel("m2_v2_set");
                    m2_v2_set.setText("<speed>_M2_set_P2:");
                    m2_v2_set.setPosition(310,170);
                    m2_v2_set.setColorValue(0xffffff00);
                    m2_v2_set.setFont(createFont("Georgia",15));
                    m2_v2_set.setGroup(G_analog_read2);                          
  accel2_text = cp5.addTextlabel("accel2_text");
                    accel2_text.setText("<accel>_M2_set:");
                    accel2_text.setPosition(310,220);
                    accel2_text.setColorValue(0xffffff00);
                    accel2_text.setFont(createFont("Georgia",15));
                    accel2_text.setGroup(G_analog_read2);
  deccel2_text = cp5.addTextlabel("deccel2_text");
                    deccel2_text.setText("<deccel>_M2_set:");
                    deccel2_text.setPosition(310,270);
                    deccel2_text.setColorValue(0xffffff00);
                    deccel2_text.setFont(createFont("Georgia",15));
                    deccel2_text.setGroup(G_analog_read2);                    
  //////////////////////                   
    pos_m2_p1 =   cp5.addNumberbox("pos_m2_p1_event").setPosition(480,15);
                     pos_m2_p1.setSize(60,30);
                     pos_m2_p1.setScrollSensitivity(0.01);
                     pos_m2_p1.setValue(0);
                     pos_m2_p1.setGroup(G_analog_read2);
                     pos_m2_p1.setFont(font_medium).setLabel("").setMin(-100).setMax(100); 
   pos_m2_p2 =   cp5.addNumberbox("pos_m2_p2_event").setPosition(480,65);
                     pos_m2_p2.setSize(60,30);
                     pos_m2_p2.setScrollSensitivity(0.01);
                     pos_m2_p2.setValue(0);
                     pos_m2_p2.setGroup(G_analog_read2);
                     pos_m2_p2.setFont(font_medium).setLabel("").setMin(-100).setMax(100);                              
     vel_m2_p1 =   cp5.addNumberbox("vel_m2_p1_event").setPosition(480,115);
                     vel_m2_p1.setSize(60,30);
                     vel_m2_p1.setScrollSensitivity(10);
                     vel_m2_p1.setValue(0);
                     vel_m2_p1.setGroup(G_analog_read2);
                     vel_m2_p1.setFont(font_medium).setLabel("").setMin(0); 
  vel_m2_p2 =   cp5.addNumberbox("vel_m2_p2_event").setPosition(480,165);
                     vel_m2_p2.setSize(60,30);
                     vel_m2_p2.setScrollSensitivity(10);
                     vel_m2_p2.setValue(0);
                     vel_m2_p2.setGroup(G_analog_read2);
                     vel_m2_p2.setFont(font_medium).setLabel("").setMin(0);                  
                     
   accel_m2   =   cp5.addNumberbox("accel_m2_event").setPosition(480,215);
                     accel_m2.setSize(60,30);
                     accel_m2.setScrollSensitivity(10);
                     accel_m2.setValue(0);
                     accel_m2.setGroup(G_analog_read2);
                     accel_m2.setFont(font_medium).setLabel("").setMin(0);                  
   deccel_m2   =   cp5.addNumberbox("deccel_m2_event").setPosition(480,265);
                     deccel_m2.setSize(60,30);
                     deccel_m2.setScrollSensitivity(10);
                     deccel_m2.setValue(0);
                     deccel_m2.setGroup(G_analog_read2);
                     deccel_m2.setFont(font_medium).setLabel("SET").setMin(0);    
                     ///////
     cur_pos_m2_p1 =   cp5.addNumberbox("cur_pos_m2_p1").setPosition(545,15);
                     cur_pos_m2_p1.setSize(60,30);
                     cur_pos_m2_p1.setScrollSensitivity(0.01);
                     cur_pos_m2_p1.setValue(0);
                     cur_pos_m2_p1.setGroup(G_analog_read2);
                     cur_pos_m2_p1.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  cur_pos_m2_p2 =   cp5.addNumberbox("cur_pos_m2_p2").setPosition(545,65);
                     cur_pos_m2_p2.setSize(60,30);
                     cur_pos_m2_p2.setScrollSensitivity(0.01);
                     cur_pos_m2_p2.setValue(0);
                     cur_pos_m2_p2.setGroup(G_analog_read2);   
                     cur_pos_m2_p2.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
 
  cur_vel_m2_p1 =   cp5.addNumberbox("cur_vel_m2_p1").setPosition(545,115);
                     cur_vel_m2_p1.setSize(60,30);
                     cur_vel_m2_p1.setScrollSensitivity(10);
                     cur_vel_m2_p1.setValue(0);
                     cur_vel_m2_p1.setGroup(G_analog_read2);
                     cur_vel_m2_p1.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);
   cur_vel_m2_p2 =   cp5.addNumberbox("cur_vel_m2_p2").setPosition(545,165);
                     cur_vel_m2_p2.setSize(60,30);
                     cur_vel_m2_p2.setScrollSensitivity(10);
                     cur_vel_m2_p2.setValue(0);
                     cur_vel_m2_p2.setGroup(G_analog_read2);
                     cur_vel_m2_p2.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);            
 
                     
  cur_accel_m2   =   cp5.addNumberbox("cur_accel_m2").setPosition(545,215);
                     cur_accel_m2.setSize(60,30);
                     cur_accel_m2.setScrollSensitivity(10);
                     cur_accel_m2.setValue(0);
                     cur_accel_m2.setGroup(G_analog_read2);
                     cur_accel_m2.setFont(font_medium).setLabel("").setMin(0).setLock(true).setColorBackground(green_);           
   cur_deccel_m2   =   cp5.addNumberbox("cur_deccel_m2").setPosition(545,265);
                     cur_deccel_m2.setSize(60,30);
                     cur_deccel_m2.setScrollSensitivity(10);
                     cur_deccel_m2.setValue(0);
                     cur_deccel_m2.setGroup(G_analog_read2);
                     cur_deccel_m2.setFont(font_medium).setLabel("NOW").setMin(0).setLock(true).setColorBackground(green_);              
                     
   //--------------------------------------------------------------   
   STATUS_m2 = cp5.addToggle("STATUS_m2")
                .setLabel("STATUS")
                .setColorBackground(black_)
                .setSize(25,25)
                .setPosition(5,460)
                .setGroup(G_analog_read2); 
  POS_1_M2_RUN = cp5.addButton("POS_1_M2_RUN_")
                .setLabel("POS_1_M2_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(40,460)
                .setGroup(G_analog_read2);    
  POS_2_M2_RUN = cp5.addButton("POS_2_M2_RUN_")
                .setLabel("POS_2_M2_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(110,460)
                .setGroup(G_analog_read2);
                
  GENTEN_2_RUN = cp5.addButton("GENTEN_2_RUN_")
                .setLabel("GENTEN_2_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(180,460)
                .setGroup(G_analog_read2);
  Save_m2 = cp5.addButton("save_m2_pos_bt")
                .setLabel("Save m2")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(390,460)
                .setGroup(G_analog_read2);
  Default_m2 = cp5.addButton("Default_m2")
                .setLabel("Default m2")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(460,460)
                .setGroup(G_analog_read2);         
 
  
                
  STATUS_m1 = cp5.addToggle("STATUS_m1")
                .setLabel("STATUS")
                .setColorBackground(black_)
                .setSize(25,25)
                .setPosition(5,410)
                .setGroup(G_analog_read2); 
             
  POS_1_M1_RUN = cp5.addButton("POS_1_M1_RUN_")
                .setLabel("POS_1_M1_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(40,410)
                .setGroup(G_analog_read2);    
  POS_2_M1_RUN = cp5.addButton("POS_2_M1_RUN_")
                .setLabel("POS_2_M1_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(110,410)
                .setGroup(G_analog_read2);
  GENTEN_1_RUN = cp5.addButton("GENTEN_1_RUN_")
                .setLabel("GENTEN_1_RUN")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(180,410)
                .setGroup(G_analog_read2);
  save_m1_pos = cp5.addButton("save_m1_pos_bt")
                .setLabel("Save m1")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(390,410)
                .setGroup(G_analog_read2);
  Default_m1 = cp5.addButton("Default_m1")
                .setLabel("Default m1")
                .setColorBackground(grey_)
                .setSize(65,25)
                .setPosition(460,410)
                .setGroup(G_analog_read2);         
 
                   
                 
                     
                     
 }
