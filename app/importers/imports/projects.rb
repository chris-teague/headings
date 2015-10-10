module Imports
  class Projects

    def self.run(files=nil)

      files ||= Dir[Rails.root.join('lib', 'imports', 'projects.csv')]

      count = 0
      fails = 0
      files.each do |file|
        count += 1
        self.new(file)
      end

      puts "Count: #{count}"
    end

    def initialize(file)
      @file = file
      import
    end

    def import
      s = SmarterCSV.process(@file, { col_sep: ",", quote_char: "\"", row_sep: :auto })
      s.each { |r| Project.create!(r) }
    end

  end
end
