
void updateArray() { // checks if all persons in the array are gone. need to and time for when the count is 0 
  if (persons.size() == 0) { //once all gone increases count and startX.
    String[] splitDate = split(row.getString(0), '/');
    //println(splitDate[0], " ", lastDate[0]);
    if (int(splitDate[0]) == int(lastDate[0])) {
      count = count + row.getInt(1);
      index++; //increases index to the next row
      row = peopleCount.getRow(index);
    } else {  
      //println(row.getString(0), " ", count); //debugging to see if the count is working
      lastDate = split(row.getString(0), '/');
      startX = -50; //startX has to be updated as else it continues to get further and further back.
      for (int i = 0; i < count; i++) { //creates new persons according to the new count.
        persons.add(new Person(startX, startY, speed, personSize)); 
        startX = startX - 50;
      }
      count = row.getInt(1);
      index++;
      row = peopleCount.getRow(index);
    }
  }
}
