module Imports
  class Machines

    def self.run(files=nil)

      files ||= Dir[Rails.root.join('lib', 'imports', 'machines.csv')]

      count = 0
      fails = 0
      files.each do |file|
        count += 1
        self.new(file, 11)
      end

      puts "Count: #{count}"
    end

    def initialize(file, project_id=nil)
      @file = file
      @project = project_id ? Project.find(project_id) : Project.where(name: 'Broadmeadow').first
      import
    end

    def import
      s = SmarterCSV.process(@file, { col_sep: ",", quote_char: "\"", row_sep: :auto })
      s.each do |r|
        r.merge!({project_id: @project.id})
        Machine.create!(r)
      end
    end

  end
end
