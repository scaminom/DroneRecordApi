module FilteringService
  class Base
    def initialize(records, params)
      @records = records
      @params = params
    end

    def filter
      raise NotImplementedError, 'Subclasses must implement a filter method'
    end
  end

  class WeekFilter < Base
    def filter
      start_date = Date.today.beginning_of_week(:sunday)
      end_date = Date.today
      @records.where(fecha_registro: start_date..end_date)
    end
  end

  class MonthFilter < Base
    def filter
      start_date = Date.today.beginning_of_month
      end_date = Date.today
      @records.where(fecha_registro: start_date..end_date)
    end
  end

  class DayFilter < Base
    def filter
      start_date = @params[:start_date].to_date&.beginning_of_day
      end_date = @params[:end_date]&.to_date&.end_of_day
      @records.where(fecha_registro: start_date..end_date)
    end
  end

  class CurrentFilter < Base
    def filter
      @records.order(fecha_registro: :desc).limit(5)
    end
  end
end
