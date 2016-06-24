def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {:name => name, :cohort => :november}
    puts "Now we have #{students.count} great student(s)"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |students|
    puts "#{students[:name]} (#{students[:cohort].capitalize} cohort)"
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def interactive_menu
  students = []
  loop do
    #1. Print the menu and asks the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it into a variable
    selection = gets.chomp
    # 3. Do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what that means, try again"
    end
  end
end


interactive_menu
#Call the methods
print_header
print(students)
print_footer(students)
