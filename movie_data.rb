
class MovieData
	attr_accessor :filename, :data
	def load_data(filename)
		@filename = filename
		@data = {}
		File.open(filename, 'r').each_line do |line|
			line = line.split '\t'
			@data[line.first.to_s] = line.last.to_s
		end
	end
	#print each element
	def data_to_s
		@data.each { |a| puts a}
	end
end


#test
data = MovieData.new()
data.load_data("u.data")
data.data_to_s