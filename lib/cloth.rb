class Cloth
  attr_reader :title, :type, :temper

  def initialize(current_path)
    item = File.readlines(current_path, chomp: true)

    @title = item[0]
    @type = item[1]
    @temper = item[2].delete("( )").split(",")
    # Переводит строковое содержимое массива в числовые значения
    @temper.map! { |item| item.to_i}
  end

  def for_weather?(out_temp)
    if out_temp.between?(@temper[0], @temper[1])
      true
    else
      false
    end
  end
end