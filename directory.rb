def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get first name
  name = gets.chomp
  #while name is not empty, repeat this code
  while !name.empty? do
    #add student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  until count == students.length
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count +=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def first_letter(students)
  puts "Select first letter to sort students by:"
  letter = gets.chomp
  puts "Students whos name begins with '#{letter}':"
  count = 1
  students.each do |s|
    if s[:name][0] == letter
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end

def shortys(students)
  puts "Students with short names:"
  count = 1
  students.each do |s|
    if s[:name].gsub(" ","").length < 12
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end


students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
