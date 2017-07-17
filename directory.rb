
# List of all the students in array
students = [
 "The students of Villains Academy",
 "-------------",
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

# Printing students in the array
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
print "Overall, we have #{students.count} great students"
