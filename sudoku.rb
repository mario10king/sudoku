class Sudoku
	def initialize(puzzle)
		puzzle = puzzle.split("")
		board(puzzle)
	end
	def board(numbers)
		game_board = []
		row = []
		i = 0
		n = 0
 		while i < 9
			x = 0
			while x < 9
				row << numbers[n].to_i
				game_board << row
				x += 1
				n += 1
			end
			i += 1
		end
		print game_board
	end
	def column
	end
	def row 
	end
	def box
	end
end

Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')