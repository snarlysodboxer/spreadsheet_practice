class Cell
  attr_reader :referenced_cells
  def initialize
    @referenced_cells = Array.new
  end

  def create_reference_to(cell)
    @referenced_cells << cell
  end

  def has_circular_references?
    true_false = false
    @referenced_cells.each do |referenced_cell|
      if referenced_cell == self
        true_false = true
      elsif find_all_referenced_cells.include? self
        true_false = true
      end
    end
    true_false
  end

  def find_all_referenced_cells
    cells = @referenced_cells
    more_references = true
    while more_references do
      cells_count = cells.length
      cells.each do |cell|
        cell.referenced_cells.each do |cell|
          unless cells.include? cell ; cells << cell ; end
        end
      end
      if cells_count == cells.length
        more_references = false
      end
    end
    cells
  end
end
