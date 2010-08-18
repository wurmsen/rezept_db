module CategoriesHelper
  def array_for_order_select_field
    array = []
    (Category.count + 1).times.each do |c|
      c += 1
      array << [c, c]
    end
    array
  end
end
