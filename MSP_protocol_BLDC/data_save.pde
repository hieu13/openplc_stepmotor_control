Table table;


void set_table_data(){
  table = new Table();
  table.addColumn("day");
  table.addColumn("time");
  table.addColumn("Alog_in0");
  table.addColumn("Alog_in1");
  table.addColumn("Alog_in2");
  table.addColumn("Alog_in3");
  table.addColumn("Alog_in4");
  table.addColumn("Alog_in5");
  table.addColumn("Alog_in6");
  table.addColumn("Alog_in7");
}

void saveData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
 // table = loadTable("data.csv", "header");

  
  
  TableRow newRow = table.addRow();
  newRow.setString("day",str(year())+":"+str(month())+":"+str(day()));
  newRow.setString("time",str(hour())+":"+str(minute())+":"+str(second()));
  //newRow.setInt("Alog_in0",readRegs[0]);
  //newRow.setInt("Alog_in1",readRegs[1]);
  //newRow.setInt("Alog_in2",readRegs[2]);
  //newRow.setInt("Alog_in3",readRegs[3]);
  //newRow.setInt("Alog_in4",readRegs[4]);
  //newRow.setInt("Alog_in5",readRegs[5]);
  //newRow.setInt("Alog_in6",readRegs[6]);
  //newRow.setInt("Alog_in7",readRegs[7]);
  
  saveTable(table, "data/data.csv");
}
