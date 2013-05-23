class Spreadsheet
  attr_reader :cells
  def initialize
    @cells = Array.new
  end

  def new_cell(cell)
    @cells << cell
  end

  def has_circular_references?
    true_false = false
    @cells.each do |cell|
      if cell.has_circular_references?
        true_false = true
      end
    end
    true_false
  end
end
