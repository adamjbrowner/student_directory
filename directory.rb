#Adding all the students to an array.
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#The following code prints the list of students at Villains Academy.
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#Then, we add the total number of students.
puts "Overall, we have #{students.count} great students"
