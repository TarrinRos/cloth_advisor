require 'date'

class MeteoData

  attr_reader :parsed_date, :min_temp

  def initialize(forecast)
    @parsed_date = get_parsed_date(forecast)
    @min_temp = get_min_temp(forecast)
  end

  private

  # Возвращает дату в формате ДД.ММ.ГГГГ
  def get_parsed_date(forecast)
    raw_date = "#{forecast.attributes['day']}.#{forecast.attributes['month']}.#{forecast.attributes['year']}"
    parsed_date = Date.parse(raw_date).strftime('%d.%m.%Y')

    # Возвращает "Сегодня", если дата совпадает с текушей
    parsed_date == Date.today ? parsed_date = 'Сегодня' : parsed_date
    parsed_date
  end

  # Возвращает минимальную температуру
  def get_min_temp(forecast)
    forecast.elements['TEMPERATURE'].attributes['min'].to_i
  end
end