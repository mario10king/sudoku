class Sudoku
	
	def initialize(puzzle)
		@puzzle = puzzle.split("")
		create_rows
		create_columns
		create_boxes
	end 
	
	def solve!
		for i in 0..8
			x = 0
			for x in 0..8
				if @rows[i][x] == 0
					for n in 1..9 do
						if check_row(n, i) && check_column(n, x) && check_box(n, i, x)
							@rows[i][x] = n
						  solution = Sudoku.new(@rows.join.to_s).solve!
						  return solution if solution
						end
					end
						return
				end
			end
		end
		 return @rows.join.to_s 
	end
	
	private


	def create_rows
		@rows = []
		row = []
		x = 0
		@puzzle.each do |num|
			row << num.to_i
			x += 1
			if x == 9 
				@rows << row
			 	x = 0 
			 	row = []
			end
		end
	end

	def create_columns
		@columns = Array.new(9){Array.new}
		for i in 0..8
			@rows[i].each_with_index do |val , index|
				@columns[index] << val
			end
		end
	end
	
	def create_boxes
		@boxes = Array.new(9){Array.new}
		for i in 0..8 
			for j in 0..2
				k = 0
				for k in 0..2
					row_index = j + (3 * (i / 3))
					column_index = k + (3 * (i % 3))			
					@boxes[i] << @rows[row_index][column_index]
				end
			end
		end
	end

	def check_row(digit, row_index)
		if @rows[row_index].include?(digit)
			return false
		end
		return true
	end
	
	def check_column(digit, column_index)
		if @columns[column_index].include?(digit)
			return false
		end
		return true
	end
	
	def check_box(digit, row_index, column_index)
		box_index = (row_index / 3) * 3 + (column_index / 3)
		if @boxes[box_index].include?(digit)
			return false
		end
		return true
	end
end

sudoku = Sudoku.new('304800000005020008007006000001200900903000401006193800000400200500012300002008706')
p sudoku.solve!

