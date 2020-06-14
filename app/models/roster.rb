class Roster < ApplicationRecord
  belongs_to :cna, foreign_key: "customer", primary_key: "code"
  belongs_to :employee, foreign_key: "employee_code", primary_key: "employee_code"
  belongs_to :company

  def self.populate
    require 'pg'

    con = PG.connect :dbname => ActiveRecord::Base.connection_config[:database], :user => ActiveRecord::Base.connection_config[:username], :password => ActiveRecord::Base.connection_config[:password]

    p_f = ProgressBar.create(:title => "RTC", :starting_at => 0, :total => File.read(Rails.root.join('docs', 'rtc.txt')).each_line.count, :format => "  %P%: %e (%c/%C): %t")

    sql = ''
    counter = 0
    File.read(Rails.root.join('docs', 'rtc.txt')).each_line do |line|
      line = line.gsub('\r\n','')
      begin
        line_array = line.encode('UTF-8', :invalid => :replace).split(',')
      rescue
        line_array = []
      end
      if line_array.count == 6
        sql = sql + "INSERT INTO rosters (company_id, customer, employee_code, long_id, start_date, end_date, created_at, updated_at) VALUES ('2','"+line_array[2]+"','"+line_array[1]+"','"+line_array[0]+"','"+Time.parse(line_array[3]+" "+line_array[4]).to_s+"','"+Time.parse(line_array[3]+" "+line_array[5]).to_s+"','"+Time.now.to_s+"','"+Time.now.to_s+"');"

        if counter % 30 == 0
          begin
            con.exec(sql)
          rescue
            # p counter.to_s+" not inserted"
          end
          sql = ''
        end
      end
      counter = counter + 1
      p_f.increment
    end
    con.exec(sql)
    p_f.finish
  end
end
