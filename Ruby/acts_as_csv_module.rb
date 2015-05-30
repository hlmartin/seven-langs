module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      return enum_for(:each) unless block_given?
      @csv_contents.each { |row| yield CsvRow.new(@headers, row) }
    end
  end

  class CsvRow
    attr_accessor :headers, :row_contents

    def initialize head, row
      @headers = head
      @row_contents = row
    end

    def to_s
      @row_contents.to_s
    end

    def method_missing column
      index = @headers.index(column.to_s)
      row_contents[index]
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

#m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

csv = RubyCsv.new
csv.each { |row| puts row.two }
