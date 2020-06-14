# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

states = [',VIC,',',NSW,',',ACT,',',QLD,',',WA,',',NT,',',SA,',',TAS,']

powerforce = Company.create(
  title: "Powerforce",
  is_admin: true
)
wollongong = Company.create(
  title: "Wollongong"
)

pf_admin = User.create(
  email: "martin@gmail.com",
  password: "testpassword3",
  password_confirmation: "testpassword3",
  is_admin: true,
  company_id: powerforce.id
)
wg_admin = User.create(
  email: "user@example.com",
  password: "testpassword3",
  password_confirmation: "testpassword3",
  company_id: wollongong.id
)

p_f = ProgressBar.create(:title => "CNA", :starting_at => 0, :total => File.read(Rails.root.join('docs', 'cna.txt')).each_line.count, :format => "  %P%: %e (%c/%C): %t")
File.read(Rails.root.join('docs', 'cna.txt')).each_line do |line|
  line = line.gsub('\r\n','')
  found = false
  states.each do |state|
    if line.split(state).count == 2
      line_array = line.split(state)[0].split(',')
      last_array = line.split(state)[1].split(',')
      Cna.create(
        code: line_array[0],
        name: line_array[1],
        address: line_array[2..line_array.length-2].join(', '),
        suburb: line_array.last,
        state: state.gsub(',',''),
        pcode: last_array[0],
        account: last_array[1],
        company_id: wollongong.id
      )
      found = true
    end
  end
  p_f.increment
end
p_f.finish

p_f = ProgressBar.create(:title => "Employees", :starting_at => 0, :total => File.read(Rails.root.join('docs', 'employee.txt')).each_line.count, :format => "  %P%: %e (%c/%C): %t")
File.read(Rails.root.join('docs', 'employee.txt')).each_line do |line|
  line = line.gsub('\r\n','')
  states.each do |state|
    if line.split(state).count == 2
      line_array = line.split(state)[0].split(',')
      last_array = line.split(state)[1].split(',')
      if line_array.count > 4
        if Client.where(client_code: line_array[3]).exists?
          client = Client.where(client_code: line_array[3]).first
        else
          client = Client.create(
            client_code: line_array[3],
            company_id: wollongong.id
          )
        end
        if client.present?
          Employee.create(
            employee_code: line_array[0],
            first_name: line_array[1],
            surname: line_array[2],
            employ_company: line_array[3],
            employee_a_street: line_array[4..line_array.length-1].join(', '),
            employee_a_suburb: line_array.last,
            employee_a_state: state.gsub(',',''),
            employee_a_post_code: last_array.first,
            company_id: wollongong.id
          )
          found = true
        end
      end
    end
  end
  p_f.increment
end
p_f.finish

Roster.populate
