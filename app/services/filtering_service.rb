module FilteringService
  class Base
    def initialize(records, params)
      @records = records
      @params = params
    end

    def filter
      raise NotImplementedError, 'Subclasses must implement a filter method'
    end

    protected

    def filter_by_uav_id(records)
      uav_id = @params[:uav_id]
      return records unless uav_id

      records.where(uav_id: uav_id)
    end
  end

  class WeekFilter < Base
    def filter
      start_date = Date.today.beginning_of_week(:sunday)
      end_date = Date.today.end_of_day
      filter_by_uav_id(@records).where(fecha_registro: start_date..end_date)
    end
  end

  class MonthFilter < Base
    def filter
      start_date = Date.today.beginning_of_month
      end_date = Date.today.end_of_day
      filter_by_uav_id(@records).where(fecha_registro: start_date..end_date)
    end
  end

  class DayFilter < Base
    def filter
      start_date = @params[:start_date].to_date&.beginning_of_day
      end_date = @params[:end_date]&.to_date&.end_of_day
      filter_by_uav_id(@records).where(fecha_registro: start_date..end_date)
    end
  end

  class CurrentFilter < Base
    def filter
      filter_by_uav_id(@records).order(fecha_registro: :desc).limit(5)
    end
  end
end