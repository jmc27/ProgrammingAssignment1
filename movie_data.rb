
class MovieData
	def load_data(filename)
		@filename = filename
		@data = {}
		File.open(filename, 'r').each_line do |line|
			line = line.strip.split '\t'
			@data[line.first.to_s] = line.last.to_s
		end
	end
	#print each element
	data.each { |a| print a, "\n"}
end
