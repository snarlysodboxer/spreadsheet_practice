require 'spec_helper'

describe Cell do
  before :each do
    @spreadsheet = Spreadsheet.new
    4.times do
      @spreadsheet.new_cell(Cell.new)
    end
  end

  it "allows non-circular references" do
    cells = @spreadsheet.cells
    cells[0].create_reference_to cells[1]
    cells[1].create_reference_to cells[2]
    cells[2].create_reference_to cells[3]
    expect(@spreadsheet.has_circular_references?).to be false
  end

  it "disallows circular references" do
    cells = @spreadsheet.cells
    cells[0].create_reference_to cells[1]
    cells[1].create_reference_to cells[2]
    cells[2].create_reference_to cells[0]
    cells[2].create_reference_to cells[3]
    expect(@spreadsheet.has_circular_references?).to be true
  end
end
