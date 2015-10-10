module Imports
  class DailyData

    def self.run(files=nil)

      files ||= Dir[Rails.root.join('lib', 'imports', 'data.csv')]

      count = 0
      fails = 0
      files.each do |file|
        count += 1
        self.new(file)
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
        r.merge!({date: Date.strptime(r[:date], '%m/%d/%Y')})
        DailySummary.create!(r)
      end

    end

  end
end
