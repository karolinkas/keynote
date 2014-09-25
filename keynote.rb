require 'terminfo'
require 'time'
# require 'pry'

class Keynote

	def initialize
		height=TermInfo.screen_size[0]
		width=TermInfo.screen_size[1]

		@heightp = height/4
		@widthp = width/2
		@counter = 0

		@slides=["first","second","third","fourth","fifth","sixth"]
		# binding.pry
	end


	def publish(heightp,widthp,slides)
		(@heightp).times{puts "\r\n|\r|\n"}
		printf @slides[@counter].rjust(widthp)
		(@heightp).times{puts "\r\n|\r|\n"}
		puts ("(p)revious".ljust(20)) + ("(n)ext".rjust(60).to_s)

		# binding.pry
	end


	def play

		publish(@heightp,@widthp,@slides[0])

		loop do

			leftright = gets.chomp

			case leftright
			when "p"
				@counter -= 1
				publish(@heightp,@widthp,@slides[@counter])
			when "n"
				@counter += 1
				publish(@heightp,@widthp,@slides[@counter])

			when "auto"
				# @t = Time.now
				loop do
					sleep(3)
					@counter += 1
					publish(@heightp,@widthp,@slides[@counter])

				end
			end

			# binding.pry
		end

	end
end

superkeynote = Keynote.new
superkeynote.play
# binding.pry
