

public void createGUI(){

//////////////// TAB
    cp5.getTab("default").setLabel("TAB1");
    cp5.getTab("default").setId(1);
    cp5.getTab("default").setHeight(20);
    cp5.getTab("default").setWidth(100);
    
    cp5.getTab("extra").setId(2);
    cp5.getTab("extra").setLabel("TAB2");
    cp5.getTab("extra").setHeight(20);
    cp5.getTab("extra").setWidth(100);
    
    cp5.addTab("Connect").setColorBackground(color(0, 160, 100));
    cp5.addTab("Connect").setColorLabel(color(255));
    cp5.addTab("Connect").setColorActive(color(255,128,0));
    cp5.getTab("Connect").setLabel("PROTOCOL");
    cp5.addTab("Connect").setId(3);
    cp5.getTab("Connect").setHeight(20);
    cp5.getTab("Connect").setWidth(100);
  
  /////////////////GROUP
  Group G_analog_read1 = cp5.addGroup("MOTOR_SETTING");
                    G_analog_read1.setPosition(10,40);
                    G_analog_read1.setFont(font_medium);
                    G_analog_read1.setBarHeight(15);
                    G_analog_read1.setBackgroundHeight(500);
                    G_analog_read1.setBackgroundColor(color(255,50));
                    G_analog_read1.setWidth(600);
                    G_analog_read1.moveTo("default");

  motor_test_gra();
  
  
  
  
  bt_save_para = cp5.addButton("bt_save_para")
                .setLabel("Upload")
                .setColorBackground(grey_)
                .setSize(65,65)
                .setPosition(530,430)
                .setGroup(G_analog_read1);  
  bt_reset_para = cp5.addButton("bt_reset_error")
                .setLabel("Reset_error")
                .setColorBackground(grey_)
                .setSize(60,30)
                .setPosition(440,465)
                .setGroup(G_analog_read1);
  

  mode1_active = cp5.addToggle("mode1_active_val")
                .setLabel("IO mode Activte")
                .setColorBackground(black_)
                .setSize(125,10)
                .setPosition(450,10)
                .setGroup(G_analog_read1);
  mode2_active = cp5.addToggle("mode2_active_val")
                .setLabel("Pulse mode Activte")
                .setColorBackground(black_)
                .setSize(125,10)
                .setPosition(450,40)
                .setGroup(G_analog_read1);
  mode3_active = cp5.addToggle("mode3_active_val")
                .setLabel("Serial mode Activte")
                .setColorBackground(black_)
                .setSize(125,10)
                .setPosition(450,70)
                .setGroup(G_analog_read1);
  
  run_mode = cp5.addTextlabel("run_mode");
                    run_mode.setText("Mode run:");
                    run_mode.setPosition(5,20);
                    run_mode.setColorValue(0xffffff00);
                    run_mode.setFont(createFont("Georgia",20));
                    run_mode.setGroup(G_analog_read1);
                    
                    
  error_mode = cp5.addTextlabel("error_mode");
                    error_mode.setText("Error:");
                    error_mode.setPosition(5,70);
                    error_mode.setColorValue(0xffffff00);
                    error_mode.setFont(createFont("Georgia",20));
                    error_mode.setGroup(G_analog_read1);
  current_motor_number = cp5.addTextlabel("current_motor_number");
                    current_motor_number.setText("Current motor number:");
                    current_motor_number.setPosition(5,120);
                    current_motor_number.setColorValue(0xffffff00);
                    current_motor_number.setFont(createFont("Georgia",20));
                    current_motor_number.setGroup(G_analog_read1);
 analog_ch5 = cp5.addTextlabel("analog_CH_3");
                    analog_ch5.setText("NC:");
                    analog_ch5.setPosition(5,170);
                    analog_ch5.setColorValue(0xffffff00);
                    analog_ch5.setFont(createFont("Georgia",20));
                    analog_ch5.setGroup(G_analog_read1);
 Resolution_1 = cp5.addTextlabel("analog_CH_4");
                    Resolution_1.setText("Res pulse m1(x100):");
                    Resolution_1.setPosition(5,220);
                    Resolution_1.setColorValue(0xffffff00);
                    Resolution_1.setFont(createFont("Georgia",20));
                    Resolution_1.setGroup(G_analog_read1);
 Resolution_2  = cp5.addTextlabel("analog_CH_5");
                    Resolution_2.setText("Res pulse m2(x100):");
                    Resolution_2.setPosition(5,270);
                    Resolution_2.setColorValue(0xffffff00);
                    Resolution_2.setFont(createFont("Georgia",20));
                    Resolution_2.setGroup(G_analog_read1);
  Pole_Pairs_1 = cp5.addTextlabel("analog_CH_6");
                    Pole_Pairs_1.setText("Pole Pairs moto 1:");
                    Pole_Pairs_1.setPosition(5,320);
                    Pole_Pairs_1.setColorValue(0xffffff00);
                    Pole_Pairs_1.setFont(createFont("Georgia",20));
                    Pole_Pairs_1.setGroup(G_analog_read1);       
 Pole_Pairs_2 = cp5.addTextlabel("analog_CH_7");
                    Pole_Pairs_2.setText("Pole Pairs moto 2:");
                    Pole_Pairs_2.setPosition(5,370);
                    Pole_Pairs_2.setColorValue(0xffffff00);
                    Pole_Pairs_2.setFont(createFont("Georgia",20));
                    Pole_Pairs_2.setGroup(G_analog_read1);            
  
  /////////////////////////////
  number_runmode =   cp5.addNumberbox("DATA_CH_0").setPosition(230,15);
                     number_runmode.setSize(80,30);
                     number_runmode.setScrollSensitivity(1);
                     number_runmode.setValue(0);
                     number_runmode.setGroup(G_analog_read1);
                     number_runmode.setMax(3);
                     number_runmode.setMin(1);
                     number_runmode.setFont(font_medium);
                    // number_runmode.setLock(true);
                    number_runmode.setLabel("");
  number_error_mode =   cp5.addNumberbox("DATA_CH_1").setPosition(230,65);
                     number_error_mode.setSize(80,30);
                     number_error_mode.setScrollSensitivity(1);
                     number_error_mode.setValue(0);
                     number_error_mode.setGroup(G_analog_read1);   
                     number_error_mode.setFont(font_medium);
                     number_error_mode.setLock(true);
                     number_error_mode.setLabel("");
  number_motor =   cp5.addNumberbox("DATA_CH_2").setPosition(230,115);
                     number_motor.setSize(80,30);
                     number_motor.setScrollSensitivity(1);
                     number_motor.setValue(0);
                     number_motor.setGroup(G_analog_read1);
                     number_motor.setFont(font_medium);
                     number_motor.setMax(2);
                     number_motor.setMin(1);
                     number_motor.setLabel("");
  current_motor_num =   cp5.addNumberbox("DATA_CH_3").setPosition(230,165);
                     current_motor_num.setSize(80,30);
                     current_motor_num.setScrollSensitivity(1);
                     current_motor_num.setValue(0);
                     current_motor_num.setGroup(G_analog_read1);
                     current_motor_num.setFont(font_medium);  
                     current_motor_num.setLabel("");
  Resolution_m1 =   cp5.addNumberbox("DATA_CH_4").setPosition(230,215);
                     Resolution_m1.setSize(80,30);
                     Resolution_m1.setScrollSensitivity(1);
                     Resolution_m1.setValue(0);
                     Resolution_m1.setGroup(G_analog_read1);
                     Resolution_m1.setFont(font_medium);   
                     Resolution_m1.setMin(1);
                     Resolution_m1.setLabel("");
   Resolution_m2 =   cp5.addNumberbox("DATA_CH_5").setPosition(230,265);
                     Resolution_m2.setSize(80,30);
                     Resolution_m2.setScrollSensitivity(1);
                     Resolution_m2.setValue(0);
                     Resolution_m2.setGroup(G_analog_read1);
                     Resolution_m2.setFont(font_medium);          
                     Resolution_m2.setMin(1);
                     Resolution_m2.setLabel("");
  Pole_Pairs_m1 =   cp5.addNumberbox("DATA_CH_6").setPosition(230,315);
                     Pole_Pairs_m1.setSize(80,30);
                     Pole_Pairs_m1.setScrollSensitivity(1);
                     Pole_Pairs_m1.setValue(0);
                     Pole_Pairs_m1.setGroup(G_analog_read1);
                     Pole_Pairs_m1.setFont(font_medium); 
                     Pole_Pairs_m1.setMin(6);
                     Pole_Pairs_m1.setLabel("");
  Pole_Pairs_m2 =   cp5.addNumberbox("DATA_CH_7").setPosition(230,365);
                     Pole_Pairs_m2.setSize(80,30);
                     Pole_Pairs_m2.setScrollSensitivity(1);
                     Pole_Pairs_m2.setValue(0);
                     Pole_Pairs_m2.setGroup(G_analog_read1);
                     Pole_Pairs_m2.setFont(font_medium); 
                     Pole_Pairs_m2.setMin(6);
                     Pole_Pairs_m2.setLabel("SET");
   //////////////////////////////////////////////colum data mode 2                  
   cur_number_runmode =   cp5.addNumberbox("cur_number_runmode").setPosition(330,15);
                     cur_number_runmode.setSize(50,30);
                     cur_number_runmode.setScrollSensitivity(1);
                     cur_number_runmode.setValue(0);
                     cur_number_runmode.setGroup(G_analog_read1);
                     cur_number_runmode.setMax(3);
                     cur_number_runmode.setMin(0);
                     cur_number_runmode.setFont(font_medium).setLabel("");
                     cur_number_runmode.setLock(true).setColorBackground(green_);
  cur_number_error_mode =   cp5.addNumberbox("cur_number_error_mode").setPosition(330,65);
                     cur_number_error_mode.setSize(50,30);
                     cur_number_error_mode.setScrollSensitivity(1);
                     cur_number_error_mode.setValue(0);
                     cur_number_error_mode.setGroup(G_analog_read1);   
                     cur_number_error_mode.setFont(font_medium);
                     cur_number_error_mode.setLabel("").setLock(true).setColorBackground(green_);
  cur_number_motor =   cp5.addNumberbox("cur_number_motor").setPosition(330,115);
                     cur_number_motor.setSize(50,30);
                     cur_number_motor.setScrollSensitivity(1);
                     cur_number_motor.setValue(0);
                     cur_number_motor.setGroup(G_analog_read1);
                     cur_number_motor.setFont(font_medium);
                     cur_number_motor.setMax(2);
                     cur_number_motor.setMin(1).setLabel("").setLock(true).setColorBackground(green_);
  cur_current_motor_num =   cp5.addNumberbox("cur_current_motor_num").setPosition(330,165);
                     cur_current_motor_num.setSize(50,30);
                     cur_current_motor_num.setScrollSensitivity(1);
                     cur_current_motor_num.setValue(0);
                     cur_current_motor_num.setGroup(G_analog_read1);
                     cur_current_motor_num.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);   
  cur_Resolution_m1 =   cp5.addNumberbox("cur_Resolution_m1").setPosition(330,215);
                     cur_Resolution_m1.setSize(50,30);
                     cur_Resolution_m1.setScrollSensitivity(1);
                     cur_Resolution_m1.setValue(0);
                     cur_Resolution_m1.setGroup(G_analog_read1);
                     cur_Resolution_m1.setFont(font_medium);   
                     cur_Resolution_m1.setMin(1).setMax(250).setLabel("").setLock(true).setColorBackground(green_);
   cur_Resolution_m2 =   cp5.addNumberbox("cur_Resolution_m2").setPosition(330,265);
                     cur_Resolution_m2.setSize(50,30);
                     cur_Resolution_m2.setScrollSensitivity(1);
                     cur_Resolution_m2.setValue(0);
                     cur_Resolution_m2.setGroup(G_analog_read1);
                     cur_Resolution_m2.setFont(font_medium);          
                     cur_Resolution_m2.setMin(1).setMax(250).setLabel("").setLock(true).setColorBackground(green_);
  cur_Pole_Pairs_m1 =   cp5.addNumberbox("cur_Pole_Pairs_m1").setPosition(330,315);
                     cur_Pole_Pairs_m1.setSize(50,30);
                     cur_Pole_Pairs_m1.setScrollSensitivity(1);
                     cur_Pole_Pairs_m1.setValue(0);
                     cur_Pole_Pairs_m1.setGroup(G_analog_read1);
                     cur_Pole_Pairs_m1.setFont(font_medium); 
                     cur_Pole_Pairs_m1.setMin(6).setLabel("").setLock(true).setColorBackground(green_);
  cur_Pole_Pairs_m2 =   cp5.addNumberbox("cur_Pole_Pairs_m2").setPosition(330,365);
                     cur_Pole_Pairs_m2.setSize(50,30);
                     cur_Pole_Pairs_m2.setScrollSensitivity(1);
                     cur_Pole_Pairs_m2.setValue(0);
                     cur_Pole_Pairs_m2.setGroup(G_analog_read1);
                     cur_Pole_Pairs_m2.setFont(font_medium); 
                     cur_Pole_Pairs_m2.setMin(6).setLabel("NOW").setLock(true).setColorBackground(green_);            
                     
  /////////////////GROUP tab2
  Group motor1 = cp5.addGroup("motor_1_set_parameter");
                    motor1.setPosition(10,40);
                    motor1.setFont(font_medium);
                    motor1.setBarHeight(15);
                    motor1.setBackgroundHeight(300);
                    motor1.setBackgroundColor(color(255,50));
                    motor1.setWidth(600);
                    motor1.moveTo("extra");
                    
  Group motor2 = cp5.addGroup("motor_2_set_parameter");
                    motor2.setPosition(640,40);
                    motor2.setFont(font_medium);
                    motor2.setBarHeight(15);
                    motor2.setBackgroundHeight(300);
                    motor2.setBackgroundColor(color(255,50));
                    motor2.setWidth(600);
                    motor2.moveTo("extra");
                    
 Group fb_motor1 = cp5.addGroup("motor1_mode_3(Serial)");
                    fb_motor1.setPosition(10,380);
                    fb_motor1.setFont(font_medium);
                    fb_motor1.setBarHeight(15);
                    fb_motor1.setBackgroundHeight(250);
                    fb_motor1.setBackgroundColor(color(255,50));
                    fb_motor1.setWidth(600);
                    fb_motor1.moveTo("extra");
  Group fb_motor2 = cp5.addGroup("motor2_mode_3(Serial)");
                    fb_motor2.setPosition(640,380);
                    fb_motor2.setFont(font_medium);
                    fb_motor2.setBarHeight(15);
                    fb_motor2.setBackgroundHeight(250);
                    fb_motor2.setBackgroundColor(color(255,50));
                    fb_motor2.setWidth(600);
                    fb_motor2.moveTo("extra");                   
   
  
  
  
  
                    
                    
  bt_save_para1 = cp5.addButton("bt_save_para1_event")
                .setLabel("Upload_para1")
                .setColorBackground(grey_)
                .setSize(65,65)
                .setPosition(530,230)
                .setGroup(motor1);  
  bt_reset_para1 = cp5.addButton("bt_reset_para1_event")
                .setLabel("Reset")
                .setColorBackground(grey_)
                .setSize(30,30)
                .setPosition(490,265)
                .setGroup(motor1);               
  bt_save_para2 = cp5.addButton("bt_save_para2_event")
                .setLabel("Upload_para2")
                .setColorBackground(grey_)
                .setSize(65,65)
                .setPosition(530,230)
                .setGroup(motor2);  
  bt_reset_para2 = cp5.addButton("bt_reset_para2_event")
                .setLabel("Reset")
                .setColorBackground(grey_)
                .setSize(30,30)
                .setPosition(490,265)
                .setGroup(motor2);                   
                    
                    
                    
                    
                    
                    
                    
  
  PID_POSITION1 = cp5.addTextlabel("PID_POSITION1");
                    PID_POSITION1.setText("PID_POSITION1");
                    PID_POSITION1.setPosition(5,20);
                    PID_POSITION1.setColorValue(0xffffff00);
                    PID_POSITION1.setFont(createFont("Georgia",13));
                    PID_POSITION1.setGroup(motor1);
  PID_VELOCITY1 = cp5.addTextlabel("PID_VELOCITY1");
                    PID_VELOCITY1.setText("PID_VELOCITY1");
                    PID_VELOCITY1.setPosition(5,70);
                    PID_VELOCITY1.setColorValue(0xffffff00);
                    PID_VELOCITY1.setFont(createFont("Georgia",13));
                    PID_VELOCITY1.setGroup(motor1);                  
  VOL_INPUT1 = cp5.addTextlabel("VOL_INPUT1");
                    VOL_INPUT1.setText("VOL_INPUT1");
                    VOL_INPUT1.setPosition(5,120);
                    VOL_INPUT1.setColorValue(0xffffff00);
                    VOL_INPUT1.setFont(createFont("Georgia",13));
                    VOL_INPUT1.setGroup(motor1);       
 VOL_LIMIT1 = cp5.addTextlabel("VOL_LIMIT1");
                    VOL_LIMIT1.setText("VOL_LIMIT1");
                    VOL_LIMIT1.setPosition(5,170);
                    VOL_LIMIT1.setColorValue(0xffffff00);
                    VOL_LIMIT1.setFont(createFont("Georgia",13));
                    VOL_LIMIT1.setGroup(motor1);           
 PID_POSITION2 = cp5.addTextlabel("PID_POSITION2");
                    PID_POSITION2.setText("PID_POSITION2");
                    PID_POSITION2.setPosition(5,20);
                    PID_POSITION2.setColorValue(0xffffff00);
                    PID_POSITION2.setFont(createFont("Georgia",13));
                    PID_POSITION2.setGroup(motor2);
  PID_VELOCITY2 = cp5.addTextlabel("PID_VELOCITY2");
                    PID_VELOCITY2.setText("PID_VELOCITY2");
                    PID_VELOCITY2.setPosition(5,70);
                    PID_VELOCITY2.setColorValue(0xffffff00);
                    PID_VELOCITY2.setFont(createFont("Georgia",13));
                    PID_VELOCITY2.setGroup(motor2);                  
  VOL_INPUT2 = cp5.addTextlabel("VOL_INPUT2");
                    VOL_INPUT2.setText("VOL_INPUT2");
                    VOL_INPUT2.setPosition(5,120);
                    VOL_INPUT2.setColorValue(0xffffff00);
                    VOL_INPUT2.setFont(createFont("Georgia",13));
                    VOL_INPUT2.setGroup(motor2);       
 VOL_LIMIT2 = cp5.addTextlabel("VOL_LIMIT2");
                    VOL_LIMIT2.setText("VOL_LIMIT2");
                    VOL_LIMIT2.setPosition(5,170);
                    VOL_LIMIT2.setColorValue(0xffffff00);
                    VOL_LIMIT2.setFont(createFont("Georgia",13));
                    VOL_LIMIT2.setGroup(motor2);            
  ///////////////////////////////////
  text_P_pos_1 = cp5.addTextlabel("text_P_pos_1");
                    text_P_pos_1.setText("0");
                    text_P_pos_1.setPosition(120,37);
                    text_P_pos_1.setColorValue(0xffffff00);
                    text_P_pos_1.setFont(createFont("Georgia",13));
                    text_P_pos_1.setGroup(motor1); 
   text_P_vel_1 = cp5.addTextlabel("text_P_vel_1");
                    text_P_vel_1.setText("0");
                    text_P_vel_1.setPosition(120,87);
                    text_P_vel_1.setColorValue(0xffffff00);
                    text_P_vel_1.setFont(createFont("Georgia",13));
                    text_P_vel_1.setGroup(motor1);             
   text_volin_1 = cp5.addTextlabel("text_volin_1");
                    text_volin_1.setText("0");
                    text_volin_1.setPosition(120,137);
                    text_volin_1.setColorValue(0xffffff00);
                    text_volin_1.setFont(createFont("Georgia",13));
                    text_volin_1.setGroup(motor1);                  
    text_vol_limit1 = cp5.addTextlabel("text_vol_limit1");
                    text_vol_limit1.setText("0");
                    text_vol_limit1.setPosition(120,187);
                    text_vol_limit1.setColorValue(0xffffff00);
                    text_vol_limit1.setFont(createFont("Georgia",13));
                    text_vol_limit1.setGroup(motor1); 
   //////////////////////                 
                    
    text_P_pos_2 = cp5.addTextlabel("text_P_pos_2");
                    text_P_pos_2.setText("0");
                    text_P_pos_2.setPosition(120,37);
                    text_P_pos_2.setColorValue(0xffffff00);
                    text_P_pos_2.setFont(createFont("Georgia",13));
                    text_P_pos_2.setGroup(motor2);                 
    text_P_vel_2 = cp5.addTextlabel("text_P_vel_2");
                    text_P_vel_2.setText("0");
                    text_P_vel_2.setPosition(120,87);
                    text_P_vel_2.setColorValue(0xffffff00);
                    text_P_vel_2.setFont(createFont("Georgia",13));
                    text_P_vel_2.setGroup(motor2);             
   text_volin_2 = cp5.addTextlabel("text_volin_2");
                    text_volin_2.setText("0");
                    text_volin_2.setPosition(120,137);
                    text_volin_2.setColorValue(0xffffff00);
                    text_volin_2.setFont(createFont("Georgia",13));
                    text_volin_2.setGroup(motor2);                  
    text_vol_limit2 = cp5.addTextlabel("text_vol_limit2");
                    text_vol_limit2.setText("0");
                    text_vol_limit2.setPosition(120,187);
                    text_vol_limit2.setColorValue(0xffffff00);
                    text_vol_limit2.setFont(createFont("Georgia",13));
                    text_vol_limit2.setGroup(motor2);       
                    
  ///////////////
  P_pos_1 =   cp5.addNumberbox("P_pos_1").setPosition(120,5);
                     P_pos_1.setSize(70,30);
                     P_pos_1.setScrollSensitivity(0.01);
                     P_pos_1.setValue(0);
                     P_pos_1.setGroup(motor1);
                     P_pos_1.setFont(font_medium).setMin(0).setLabel("");
  P_vel_1 =   cp5.addNumberbox("P_vel_1").setPosition(120,55);
                     P_vel_1.setSize(70,30);
                     P_vel_1.setScrollSensitivity(0.01);
                     P_vel_1.setValue(0);
                     P_vel_1.setGroup(motor1);   
                     P_vel_1.setFont(font_medium).setMin(0).setLabel("");
  volin_1 =   cp5.addNumberbox("volin_1").setPosition(120,105);
                     volin_1.setSize(70,30);
                     volin_1.setScrollSensitivity(0.01);
                     volin_1.setValue(0);
                     volin_1.setGroup(motor1);
                     volin_1.setFont(font_medium).setMin(0).setLabel("");
  vol_limit1 =   cp5.addNumberbox("vol_limit1").setPosition(120,155);
                     vol_limit1.setSize(70,30);
                     vol_limit1.setScrollSensitivity(0.01);
                     vol_limit1.setValue(0);
                     vol_limit1.setGroup(motor1);
                     vol_limit1.setFont(font_medium).setMin(0).setLabel("");            
  P_pos_2 =   cp5.addNumberbox("P_pos_2").setPosition(120,5);
                     P_pos_2.setSize(70,30);
                     P_pos_2.setScrollSensitivity(0.01);
                     P_pos_2.setValue(0);
                     P_pos_2.setGroup(motor2);
                     P_pos_2.setFont(font_medium).setMin(0).setLabel("");
  P_vel_2 =   cp5.addNumberbox("P_vel_2").setPosition(120,55);
                     P_vel_2.setSize(70,30);
                     P_vel_2.setScrollSensitivity(0.01);
                     P_vel_2.setValue(0);
                     P_vel_2.setGroup(motor2);   
                     P_vel_2.setFont(font_medium).setMin(0).setLabel("");
  volin_2 =   cp5.addNumberbox("volin_2").setPosition(120,105);
                     volin_2.setSize(70,30);
                     volin_2.setScrollSensitivity(0.01);
                     volin_2.setValue(0);
                     volin_2.setGroup(motor2);
                     volin_2.setFont(font_medium).setMin(0).setLabel("");
  vol_limit2 =   cp5.addNumberbox("vol_limit2").setPosition(120,155);
                     vol_limit2.setSize(70,30);
                     vol_limit2.setScrollSensitivity(0.01);
                     vol_limit2.setValue(0);
                     vol_limit2.setGroup(motor2);
                     vol_limit2.setFont(font_medium).setMin(0).setLabel("");
  ////////////
  text_I_pos_1 = cp5.addTextlabel("text_I_pos_1");
                    text_I_pos_1.setText("x");
                    text_I_pos_1.setPosition(220,37);
                    text_I_pos_1.setColorValue(0xffffff00);
                    text_I_pos_1.setFont(createFont("Georgia",13));
                    text_I_pos_1.setGroup(motor1);
  text_I_pos_2 = cp5.addTextlabel("text_I_pos_2");
                    text_I_pos_2.setText("x");
                    text_I_pos_2.setPosition(220,37);
                    text_I_pos_2.setColorValue(0xffffff00);
                    text_I_pos_2.setFont(createFont("Georgia",13));
                    text_I_pos_2.setGroup(motor2);                  
  text_I_vel_1 = cp5.addTextlabel("text_I_vel_1");
                    text_I_vel_1.setText("0");
                    text_I_vel_1.setPosition(220,87);
                    text_I_vel_1.setColorValue(0xffffff00);
                    text_I_vel_1.setFont(createFont("Georgia",13));
                    text_I_vel_1.setGroup(motor1);   
   text_I_vel_2 = cp5.addTextlabel("text_I_vel_2");
                    text_I_vel_2.setText("0");
                    text_I_vel_2.setPosition(220,87);
                    text_I_vel_2.setColorValue(0xffffff00);
                    text_I_vel_2.setFont(createFont("Georgia",13));
                    text_I_vel_2.setGroup(motor2);  
     
     
  I_pos_1 =   cp5.addNumberbox("I_pos_1").setPosition(220,5);
                     I_pos_1.setSize(70,30);
                     I_pos_1.setScrollSensitivity(0.01);
                     I_pos_1.setValue(0);
                     I_pos_1.setGroup(motor1);
                     I_pos_1.setFont(font_medium).setMin(0).setLabel("");
  I_vel_1 =   cp5.addNumberbox("I_vel_1").setPosition(220,55);
                     I_vel_1.setSize(70,30);
                     I_vel_1.setScrollSensitivity(0.01);
                     I_vel_1.setValue(0);
                     I_vel_1.setGroup(motor1);   
                     I_vel_1.setFont(font_medium).setMin(0).setLabel("");
 
                     
  I_pos_2 =   cp5.addNumberbox("I_pos_2").setPosition(220,5);
                     I_pos_2.setSize(70,30);
                     I_pos_2.setScrollSensitivity(0.01);
                     I_pos_2.setValue(0);
                     I_pos_2.setGroup(motor2);
                     I_pos_2.setFont(font_medium).setMin(0).setLabel("");
  I_vel_2 =   cp5.addNumberbox("I_vel_2").setPosition(220,55);
                     I_vel_2.setSize(70,30);
                     I_vel_2.setScrollSensitivity(0.01);
                     I_vel_2.setValue(0);
                     I_vel_2.setGroup(motor2);   
                     I_vel_2.setFont(font_medium).setMin(0).setLabel("");
            
 //////////////SPEED///////////
 
  text_D_pos_1 = cp5.addTextlabel("text_D_pos_1");
                    text_D_pos_1.setText("x");
                    text_D_pos_1.setPosition(320,37);
                    text_D_pos_1.setColorValue(0xffffff00);
                    text_D_pos_1.setFont(createFont("Georgia",13));
                    text_D_pos_1.setGroup(motor1);   
   text_D_pos_2 = cp5.addTextlabel("text_D_pos_2");
                    text_D_pos_2.setText("x");
                    text_D_pos_2.setPosition(320,37);
                    text_D_pos_2.setColorValue(0xffffff00);
                    text_D_pos_2.setFont(createFont("Georgia",13));
                    text_D_pos_2.setGroup(motor2);  
   text_D_vel_1 = cp5.addTextlabel("text_D_vel_1");
                    text_D_vel_1.setText("0");
                    text_D_vel_1.setPosition(320,87);
                    text_D_vel_1.setColorValue(0xffffff00);
                    text_D_vel_1.setFont(createFont("Georgia",13));
                    text_D_vel_1.setGroup(motor1);
                    
   text_D_vel_2 = cp5.addTextlabel("text_D_vel_2");
                    text_D_vel_2.setText("0");
                    text_D_vel_2.setPosition(320,87);
                    text_D_vel_2.setColorValue(0xffffff00);
                    text_D_vel_2.setFont(createFont("Georgia",13));
                    text_D_vel_2.setGroup(motor2);
 
 
 
 D_pos_1 =   cp5.addNumberbox("D_pos_1").setPosition(320,5);
                     D_pos_1.setSize(70,30);
                     D_pos_1.setScrollSensitivity(0.001);
                     D_pos_1.setValue(0);
                     D_pos_1.setGroup(motor1);
                     D_pos_1.setFont(font_medium).setMin(0).setLabel("");
  D_vel_1 =   cp5.addNumberbox("D_vel_1").setPosition(320,55);
                     D_vel_1.setSize(70,30);
                     D_vel_1.setScrollSensitivity(0.001);
                     D_vel_1.setValue(0);
                     D_vel_1.setGroup(motor1);   
                     D_vel_1.setFont(font_medium).setMin(0).setLabel("");
 
                  
                  
                  
  D_pos_2 =   cp5.addNumberbox("D_pos_2").setPosition(320,5);
                     D_pos_2.setSize(70,30);
                     D_pos_2.setScrollSensitivity(0.001);
                     D_pos_2.setValue(0);
                     D_pos_2.setGroup(motor2);
                     D_pos_2.setFont(font_medium).setMin(0).setLabel("");
  D_vel_2 =   cp5.addNumberbox("D_vel_2").setPosition(320,55);
                     D_vel_2.setSize(70,30);
                     D_vel_2.setScrollSensitivity(0.001);
                     D_vel_2.setValue(0);
                     D_vel_2.setGroup(motor2);   
                     D_vel_2.setFont(font_medium).setMin(0).setLabel("");
 
                
                
//                
 bt_motor1_active = cp5.addToggle("bt_motor1_act")
                .setLabel("Activte")
                .setColorBackground(black_)
                .setSize(125,10)
                .setPosition(450,10)
                .setGroup(fb_motor1);

  button_run_pos_m1 = cp5.addButton("button_run_pos_m1_")
                .setLabel("RUN")
                .setColorBackground(red_)
                .setSize(130,25)
                .setPosition(450,150)
                .setGroup(fb_motor1);
  bt_motor1_cw = cp5.addButton("bt_motor1_cw_")
                .setLabel("JOG_CW1")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(450,180)
                .setGroup(fb_motor1);
  bt_motor1_ccw = cp5.addButton("bt_motor1_ccw_")
                .setLabel("JOG_CCW1")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(520,180)
                .setGroup(fb_motor1);
  bt_motor1_zero = cp5.addButton("bt_motor1_zero_")
                .setLabel("Zero_m1")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(450,210)
                .setGroup(fb_motor1);
 
 //bt_motor1_stop = cp5.addButton("bt_motor1_stop")
 //               .setLabel("stop_m1")
 //               .setColorBackground(red_)
 //               .setSize(60,25)
 //               .setPosition(520,210)
 //               .setGroup(fb_motor1);
              
 checkbox_speed_m1 = cp5.addRadioButton("check_speed1")
                .setPosition(450, 100)
                .setSize(10, 10)
                .setItemsPerRow(4)
                .setSpacingColumn(30)
                .setSpacingRow(20)
                .addItem("x0.01", 0)
                .addItem("x0.1", 50)
                .addItem("x1", 100)
                .addItem("x10", 150)
                .setGroup(fb_motor1);
              
  checkbox_speed_m1.activate(0);
  checkbox_speed_m1.setArrayValue(0,1);

  //                
  bt_motor5_active = cp5.addToggle("bt_motor5_act")
                .setLabel("Activte")
                .setColorBackground(black_)
                .setSize(125,10)
                .setPosition(450,10)
                .setGroup(fb_motor2);

  button_run_pos_m2 = cp5.addButton("button_run_pos_m2_")
                .setLabel("RUN")
                .setColorBackground(red_)
                .setSize(130,25)
                .setPosition(450,150)
                .setGroup(fb_motor2);
  bt_motor5_cw = cp5.addButton("bt_motor5_cw_")
                .setLabel("JOG_CW2")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(450,180)
                .setGroup(fb_motor2);
  bt_motor5_ccw = cp5.addButton("bt_motor5_ccw_")
                .setLabel("JOG_CCW2")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(520,180)
                .setGroup(fb_motor2);
  bt_motor5_zero = cp5.addButton("bt_motor5_zero_")
                .setLabel("Zero_m2")
                .setColorBackground(red_)
                .setSize(60,25)
                .setPosition(450,210)
                .setGroup(fb_motor2);
 
 //bt_motor5_stop = cp5.addButton("bt_motor5_stop")
 //               .setLabel("stop_m2")
 //               .setColorBackground(red_)
 //               .setSize(60,25)
 //               .setPosition(520,210)
 //               .setGroup(fb_motor2);
                
checkbox_speed_m2 = cp5.addRadioButton("check_speed2")
                .setPosition(450, 100)
                .setSize(10, 10)
                .setItemsPerRow(4)
                .setSpacingColumn(30)
                .setSpacingRow(20)
                .addItem("x0.01_", 0)
                .addItem("x0.1_", 50)
                .addItem("x1_", 100)
                .addItem("x10_", 150)
                .setGroup(fb_motor2);
                ;
 checkbox_speed_m2.activate(0);   
 checkbox_speed_m2.setArrayValue(0,1);
 //   ellipse(width/2, height/2, 800,600);            
       text_ofset_m1 = cp5.addTextlabel("text_ofset_m1");
                    text_ofset_m1.setText("ofset");
                    text_ofset_m1.setPosition(120,47);
                    text_ofset_m1.setColorValue(red_);
                    text_ofset_m1.setFont(createFont("Georgia",13));
                    text_ofset_m1.setGroup(fb_motor1);         
       text_ofset_m2 = cp5.addTextlabel("text_ofset_m2");
                    text_ofset_m2.setText("ofset");
                    text_ofset_m2.setPosition(120,47);
                    text_ofset_m2.setColorValue(red_);
                    text_ofset_m2.setFont(createFont("Georgia",13));
                    text_ofset_m2.setGroup(fb_motor2);            
 /////////////////////////LABEL CHUA DINH CHINH/////////////////
  motor_fb_ch0 = cp5.addTextlabel("motor_fb_ch0");
                    motor_fb_ch0.setText("now_position_1");
                    motor_fb_ch0.setPosition(5,20);
                    motor_fb_ch0.setColorValue(0xffffff00);
                    motor_fb_ch0.setFont(createFont("Georgia",15));
                    motor_fb_ch0.setGroup(fb_motor1);
  motor_fb_ch1 = cp5.addTextlabel("motor_fb_ch1");
                    motor_fb_ch1.setText("now_speed_1");
                    motor_fb_ch1.setPosition(5,80);
                    motor_fb_ch1.setColorValue(0xffffff00);
                    motor_fb_ch1.setFont(createFont("Georgia",15));
                    motor_fb_ch1.setGroup(fb_motor1);                  
  motor_fb_ch2 = cp5.addTextlabel("motor_fb_ch2");
                    motor_fb_ch2.setText("now_accel_1");
                    motor_fb_ch2.setPosition(5,140);
                    motor_fb_ch2.setColorValue(0xffffff00);
                    motor_fb_ch2.setFont(createFont("Georgia",15));
                    motor_fb_ch2.setGroup(fb_motor1);       
 motor_fb_ch3 = cp5.addTextlabel("motor_fb_ch3");
                    motor_fb_ch3.setText("now_deccel_1");
                    motor_fb_ch3.setPosition(5,200);
                    motor_fb_ch3.setColorValue(0xffffff00);
                    motor_fb_ch3.setFont(createFont("Georgia",15));
                    motor_fb_ch3.setGroup(fb_motor1);           
 motor_fb_ch4 = cp5.addTextlabel("motor_fb_ch4");
                    motor_fb_ch4.setText("now_position_2");
                    motor_fb_ch4.setPosition(5,20);
                    motor_fb_ch4.setColorValue(0xffffff00);
                    motor_fb_ch4.setFont(createFont("Georgia",15));
                    motor_fb_ch4.setGroup(fb_motor2);
  motor_fb_ch5 = cp5.addTextlabel("motor_fb_ch5");
                    motor_fb_ch5.setText("now_speed_2");
                    motor_fb_ch5.setPosition(5,80);
                    motor_fb_ch5.setColorValue(0xffffff00);
                    motor_fb_ch5.setFont(createFont("Georgia",15));
                    motor_fb_ch5.setGroup(fb_motor2);                  
  motor_fb_ch6 = cp5.addTextlabel("motor_fb_ch6");
                    motor_fb_ch6.setText("now_accel_2");
                    motor_fb_ch6.setPosition(5,140);
                    motor_fb_ch6.setColorValue(0xffffff00);
                    motor_fb_ch6.setFont(createFont("Georgia",15));
                    motor_fb_ch6.setGroup(fb_motor2);       
 motor_fb_ch7 = cp5.addTextlabel("motor_fb_ch7");
                    motor_fb_ch7.setText("now_deccel_2");
                    motor_fb_ch7.setPosition(5,200);
                    motor_fb_ch7.setColorValue(0xffffff00);
                    motor_fb_ch7.setFont(createFont("Georgia",15));
                    motor_fb_ch7.setGroup(fb_motor2);
                
                
  ////
  CUR_pos_1 =   cp5.addNumberbox("CUR_pos_1").setPosition(120,15);
                     CUR_pos_1.setSize(90,30);
                     //CUR_pos_1.setScrollSensitivity(1.1);
                     CUR_pos_1.setValue(0);
                     CUR_pos_1.setGroup(fb_motor1);
                     CUR_pos_1.setFont(font_medium).setLabel("").setLock(true);   
                     CUR_pos_1.setColorBackground(green_);
                     
                     
  CUR_speed_1 =   cp5.addNumberbox("CUR_speed_1").setPosition(120,75);
                     CUR_speed_1.setSize(90,30);
                     //CUR_speed_1.setScrollSensitivity(1.1);
                     CUR_speed_1.setValue(0);
                     CUR_speed_1.setGroup(fb_motor1);   
                     CUR_speed_1.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  CUR_acc_1 =   cp5.addNumberbox("CUR_acc_1").setPosition(120,135);
                     CUR_acc_1.setSize(90,30);
                     //CUR_acc_1.setScrollSensitivity(1.1);
                     CUR_acc_1.setValue(0);
                     CUR_acc_1.setGroup(fb_motor1);
                     CUR_acc_1.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  CUR_dec_1 =   cp5.addNumberbox("CUR_1").setPosition(120,195);
                     CUR_dec_1.setSize(90,30);
                     //CUR_dec_1.setScrollSensitivity(1.1);
                     CUR_dec_1.setValue(0);
                     CUR_dec_1.setGroup(fb_motor1);
                     CUR_dec_1.setFont(font_medium).setLock(true).setColorBackground(green_);             
  CUR_pos_2 =   cp5.addNumberbox("CUR_pos_2").setPosition(120,15);
                     CUR_pos_2.setSize(90,30);
                     //CUR_pos_2.setScrollSensitivity(1.1);
                     CUR_pos_2.setValue(0);
                     CUR_pos_2.setGroup(fb_motor2);
                     CUR_pos_2.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  CUR_speed_2 =   cp5.addNumberbox("CUR_speed_2").setPosition(120,75);
                     CUR_speed_2.setSize(90,30);
                     //CUR_speed_2.setScrollSensitivity(1.1);
                     CUR_speed_2.setValue(0);
                     CUR_speed_2.setGroup(fb_motor2);   
                     CUR_speed_2.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  CUR_acc_2 =   cp5.addNumberbox("CUR_acc_2").setPosition(120,135);
                     CUR_acc_2.setSize(90,30);
                     //CUR_acc_2.setScrollSensitivity(1.1);
                     CUR_acc_2.setValue(0);
                     CUR_acc_2.setGroup(fb_motor2);
                     CUR_acc_2.setFont(font_medium).setLabel("").setLock(true).setColorBackground(green_);
  CUR_dec_2 =   cp5.addNumberbox("CUR_2").setPosition(120,195);
                     CUR_dec_2.setSize(90,30);
                     //CUR_dec_2.setScrollSensitivity(1.1);
                     CUR_dec_2.setValue(0);
                     CUR_dec_2.setGroup(fb_motor2);
                     CUR_dec_2.setFont(font_medium).setLock(true).setColorBackground(green_);
  //////////
    SET_pos_1 =   cp5.addNumberbox("SET_pos_1").setPosition(230,15);
                     SET_pos_1.setSize(90,30);
                     SET_pos_1.setScrollSensitivity(0.01);
                     SET_pos_1.setValue(0);
                     SET_pos_1.setGroup(fb_motor1);
                     SET_pos_1.setFont(font_medium).setLabel("");
  SET_speed_1 =   cp5.addNumberbox("SET_speed_1").setPosition(230,75);
                     SET_speed_1.setSize(90,30);
                     SET_speed_1.setScrollSensitivity(1);
                     SET_speed_1.setValue(0);
                     SET_speed_1.setGroup(fb_motor1);   
                     SET_speed_1.setFont(font_medium).setLabel("").setMax(50000).setMin(1); 
  SET_acc_1 =   cp5.addNumberbox("SET_acc_1").setPosition(230,135);
                     SET_acc_1.setSize(90,30);
                     SET_acc_1.setScrollSensitivity(10);
                     SET_acc_1.setValue(0);
                     SET_acc_1.setGroup(fb_motor1);
                     SET_acc_1.setFont(font_medium).setLabel("").setMax(50000).setMin(1); 
  SET_dec_1 =   cp5.addNumberbox("SET_1").setPosition(230,195);
                     SET_dec_1.setSize(90,30);
                     SET_dec_1.setScrollSensitivity(10);
                     SET_dec_1.setValue(0);
                     SET_dec_1.setGroup(fb_motor1);
                     SET_dec_1.setFont(font_medium).setMax(50000).setMin(1);                  
  SET_pos_2 =   cp5.addNumberbox("SET_pos_2").setPosition(230,15);
                     SET_pos_2.setSize(90,30);
                     SET_pos_2.setScrollSensitivity(0.01);
                     SET_pos_2.setValue(0);
                     SET_pos_2.setGroup(fb_motor2);
                     SET_pos_2.setFont(font_medium).setLabel("");
  SET_speed_2 =   cp5.addNumberbox("SET_speed_2").setPosition(230,75);
                     SET_speed_2.setSize(90,30);
                     SET_speed_2.setScrollSensitivity(1);
                     SET_speed_2.setValue(0);
                     SET_speed_2.setGroup(fb_motor2);   
                     SET_speed_2.setFont(font_medium).setLabel("").setMax(50000).setMin(1); 
  SET_acc_2 =   cp5.addNumberbox("SET_acc_2").setPosition(230,135);
                     SET_acc_2.setSize(90,30);
                     SET_acc_2.setScrollSensitivity(10);
                     SET_acc_2.setValue(0);
                     SET_acc_2.setGroup(fb_motor2);
                     SET_acc_2.setFont(font_medium).setLabel("").setMax(50000).setMin(1); 
  SET_dec_2 =   cp5.addNumberbox("SET_2").setPosition(230,195);
                     SET_dec_2.setSize(90,30);
                     SET_dec_2.setScrollSensitivity(10);
                     SET_dec_2.setValue(0);
                     SET_dec_2.setGroup(fb_motor2);
                     SET_dec_2.setFont(font_medium).setMax(50000).setMin(1);   
  ///////
    disable_m1 = cp5.addToggle("motor_1_dis_")
                .setLabel("BLDC_M1_ON")
                .setColorBackground(color(255,0,0))
                .setSize(65,25)
                .setPosition(530,320)
                .setGroup(G_analog_read1);                    
    disable_m2 = cp5.addToggle("motor_2_dis_")
                .setLabel("BLDC_M2_ON")
                .setColorBackground(color(255,0,0))
                .setSize(65,25)
                .setPosition(530,370)
                .setGroup(G_analog_read1); 
  
  
  ////////////////
    motor_1_Chart = cp5.addChart("motor_1_Chart");
                     motor_1_Chart.setPosition(200, 105);
                     motor_1_Chart.setSize(250, 180);
                     motor_1_Chart.setRange(-500, 500);
                     motor_1_Chart.setView(Chart.LINE); // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
                     motor_1_Chart.setStrokeWeight(1.5);
                     motor_1_Chart.setColorCaptionLabel(color(40));
                     motor_1_Chart.setGroup(motor1);             
                     motor_1_Chart.addDataSet("incoming");
                     motor_1_Chart.setData("incoming", new float[1500]);
                     //analog_ch0_Chart.
 motor_2_Chart = cp5.addChart("motor_2_Chart");
                     motor_2_Chart.setPosition(200, 105);
                     motor_2_Chart.setSize(250, 180);
                     motor_2_Chart.setRange(-500, 500);
                     motor_2_Chart.setView(Chart.LINE); // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
                     motor_2_Chart.setStrokeWeight(1.5);
                     motor_2_Chart.setColorCaptionLabel(color(40));
                     motor_2_Chart.setGroup(motor2);             
                     motor_2_Chart.addDataSet("incoming");
                     motor_2_Chart.setData("incoming", new float[1500]);  
                     //motor_2_Chart.
   
   ////////////////////////////
   checkbox_control_m1 = cp5.addRadioButton("check_control_m1")
                .setPosition(50, 510)
                //.setLabel("Control_motion")
                .setSize(10, 10)
                .setItemsPerRow(1)
                .setSpacingColumn(30)
                .setSpacingRow(8)
                .addItem(" angle (default) M1", 0)
                .addItem(" torque M1", 50)
                .addItem(" velocity M1", 100)
                .addItem(" velocity_openloop M1", 150)
                .addItem(" angle_openloop M1", 150)
                .setGroup(G_analog_read1);
              
  checkbox_control_m1.activate(0);
  checkbox_control_m1.setArrayValue(0,1);
   
   checkbox_control_m2 = cp5.addRadioButton("check_control_m2")
                .setPosition(200, 510)
                //.setLabel("Control_motion")
                .setSize(10, 10)
                .setItemsPerRow(1)
                .setSpacingColumn(30)
                .setSpacingRow(8)
                .addItem(" angle(default) M2", 0)
                .addItem(" torque M2", 50)
                .addItem(" velocity M2", 100)
                .addItem(" velocity_openloop M2", 150)
                .addItem(" angle_openloop M2", 150)
                .setGroup(G_analog_read1);
              
  checkbox_control_m2.activate(0);
  checkbox_control_m2.setArrayValue(0,1);
   
   
   
   
  ////////////////PROTOCOL GUI
  Group Com_uart =  cp5.addGroup("Serial");
                    Com_uart.setPosition(0,50);
                    Com_uart.setSize(500,700);
                    Com_uart.setBarHeight(18);
                    Com_uart.setBackgroundHeight(350);
                    Com_uart.setBackgroundColor(color(255,50));
                    Com_uart.moveTo("Connect");
  
  // Baud list items
baudListbox = cp5.addListBox("baudList") ;// make a listbox with available Baudrates
                baudListbox.setCaptionLabel("BAUD_RATE");
                baudListbox.setColorBackground(red_);
                baudListbox.setBarHeight(18);
                baudListbox.setHeight(100);
                baudListbox.addItem("4800"  ,4800);
                baudListbox.addItem("9600"  ,9600);
                baudListbox.addItem("14400" ,14400);
                baudListbox.addItem("19200" ,19200);
                baudListbox.addItem("28800" ,28800);
                baudListbox.addItem("38400" ,38400);
                baudListbox.addItem("57600" ,57600);
                baudListbox.addItem("115200",115200);
                baudListbox.addItem("240000",240000);
                baudListbox.setSize(140,100);
                baudListbox.setItemHeight(18);
                //.align(CENTER,CENTER)
                baudListbox.setPosition(120,5);
                
                baudListbox.setGroup(Com_uart);

commListbox = cp5.addListBox("portComList",5,5,110,120)
                .setCaptionLabel("PORT COM")
                .setColorBackground(red_)
                .setBarHeight(17)
                .setPosition(5,5)
                .setItemHeight(18)
                .setGroup(Com_uart);

btnRefresh = cp5.addButton("bREFRESH")
                .setLabel("Refresh")
                .setColorBackground(red_)
                .setSize(90,25)
                .setPosition(395,5)
                .setGroup(Com_uart);


btnQConnect = cp5.addButton("bQCONN")
                .setLabel("ReConnect")
                .setColorBackground(red_)
                .setSize(110,25)
                .setPosition(280,5)
                .setGroup(Com_uart);
                
buttonSTART  = cp5.addButton("bSTART")
                .setLabel("START")
                .setColorBackground(red_)
                .setPosition(280,30)
                .setGroup(Com_uart);
                
buttonSTOP   = cp5.addButton("bSTOP")
                .setLabel("STOP")
                .setColorBackground(red_)
                .setPosition(280,50)
                .setGroup(Com_uart);

buttonSEND  = cp5.addButton("bSEND")
                .setLabel("SEND_DATA")
                .setColorBackground(red_)
                .setSize(100,50)
                .setPosition(360,150)
                .setGroup(Com_uart);
  cp5.addTextfield("input_data")
     .setPosition(10,150)
     .setSize(300,25)
     .setFont(font_medium)
     .setFocus(true)
     .setColor(color(250,250,250))
     .setGroup(Com_uart)
     ;
  
  for(int i=0;i<Serial.list().length;i++) {
    String pn = shortifyPortName(Serial.list()[i], 13);
    //if( pn.startsWith("/dev/ttyUSB") ) {
      if (pn.length() >0 ) commListbox.addItem(pn,i); // addItem(name,value)
      commListMax = i;
    
  }
    
txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom","No Port Selected")
                  .setPosition(280,70)
                  .setGroup(Com_uart);
                  ; 

txtlblcom_connect = cp5.addTextlabel("txtlblcom_connect","Not Connected")
                  .setPosition(280,90)
                  .setGroup(Com_uart);
                  ; 


myTextarea = cp5.addTextarea("serial_txt")
                  .setPosition(5,200)
                  .setSize(350,120)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(100,100,100))
                  .setColorForeground(color(255,100))
                  .setGroup(Com_uart);
                  
//console = cp5.addConsole(myTextarea);//

}
