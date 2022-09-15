class Student < ApplicationRecord

   	require 'csv'
   
    validates :email,:name,:studentID, presence: true 
  	validates :phone_number, length: { is: 10 }
  	validates :phone_number, numericality: { only_integer: true }
  	validates :studentID, length:{is: 2}	
  	validates :studentID,:email, uniqueness: true
  	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
 
    before_validation do
        self.studentID =  rand(10..99)
    end

    def self.func(csv_file)
        CSV.foreach(csv_file.path, headers: true) do |r|
            obj = Student.new
         	obj.name = r[0]
            obj.phone_number =r[1]
            obj.email = r[2]
            if obj.save
            else
                puts "Student not save"
            end
        end
    end
  
end
