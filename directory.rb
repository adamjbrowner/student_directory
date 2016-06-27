@students = []

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "File successfully loaded!".center(50)
end

def try_load_students #Loads students.csv at beggining of program
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(50)
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def input_students #Adds students to array
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {:name => name, :cohort => :november}
    puts "Input successful!".center(50)
    puts "Now we have #{@students.count} great student(s)".center(50)
    name = gets.chomp
  end
end

def print_header #Prints header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list(students)
  @students.each do |students|
    puts "#{students[:name]} (#{students[:cohort].capitalize} cohort)".center(50)
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have 1 great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what that means, try again".center(50)
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File successfully saved"
end

try_load_students
interactive_menu
