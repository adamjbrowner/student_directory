@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {:name => name, :cohort => :november}
    puts "Now we have #{@students.count} great student(s)"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students)
  @students.each do |students|
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what that means, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


interactive_menu
#Call the methods
print_header
print(students)
print_footer(students)
