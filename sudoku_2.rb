class Sudoku
	
	def initialize(puzzle)
		@puzzle = puzzle
		board 
	end 
	
	def board
		@puzzle = @puzzle.split("")
		@game = []
		@box = []
		for r in 0 .. 9 
			@box[r] = []
		end
		row = []
		x = 0
		@puzzle.each do |digit|
			row << digit.to_i
			x += 1
			if x == 9 
				@game << row
			 	x = 0 
			 	row = []
			end
		end
		for k in 0..8 
		i = 0
			while i < 3
		t = 0
				while t < 3
					@box[k] << @game[i + 3*(k/3)][t + 3*(k%3)]
					t += 1
				end
				i += 1
			end
		end
	end
	
	def solve!
		i = 0
		while i < 9 
			x = 0
			while x < 9
				if @game[i][x] == 0
					for n in 1..9 do
						if row(n, i) && column(n, x) && box(n, i, x)
							@game[i][x] = n
						  solution = Sudoku.new(@game.join.to_s).solve!
						  return solution if solution
						end
					end
						return
				end
				x += 1
			end
			i += 1
		end
		 return @game.join.to_s 
	end
	
	def row(digit, row_number)
		if @game[row_number].include? digit
			return false
		end
		return true
	end
	
	def column(digit, column_number)
		@game.each do |row|
			if row[column_number] == digit
				return false
			end
		end
		return true
	end
	
	def box(digit, row_number, column_number)
		if @box[(row_number/3) * 3 + column_number/3].include?(digit)
			return false
		else
			return true
		end
	end
end

sudoku = Sudoku.new('304800000005020008007006000001200900903000401006193800000400200500012300002008706')
p sudoku.solve!

