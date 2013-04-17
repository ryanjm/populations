# Responsible for taking in the csv and passing back each
# area as a hash

class CSVReader
  
  def initialize(filename)
    @fname = filename
  end

  def read
    f = File.new(@fname, 'r')
    
    # Grab the headers
    self.headers = f.readline

    # Loop over the lines
    while (!f.eof? && next_line = f.readline)
      values = next_line.split(',')
      hash = create_hash(values)
      yield(hash)
    end
  end

  def headers=(header_str)
    @headers = header_str.split(',')

    @headers.map! do |h|
      # remove quotes
      new_header = h.gsub('"', '')
      # remove new line
      new_header.strip!
      # convert to a symbol
      new_header.to_sym
    end
  end

  # TODO: create method to convert cammelCase to snake_case

  def create_hash(values)
    h = {}
    @headers.each_with_index do |header, i|
      # remove new lines from the value
      value = values[i].strip
      h[header] = value unless value.empty?
    end
    h
  end
end
