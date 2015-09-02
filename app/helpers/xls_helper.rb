module XlsHelper
  def format_row(row, format)
    row.each_with_index do |_row_item, index|
      row.set_format(index, format)
    end
  end
end
