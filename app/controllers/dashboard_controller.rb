class DashboardController < ApplicationController
  def index
    @samples_2hours = Sample.order(uptime: :desc)

    @max_current = Sample.maximum('humidity')
    @min_current = Sample.minimum('humidity')
    @average_current = Sample.average('humidity')

    @max_voltage = Sample.maximum('temperature')
    @min_voltage = Sample.minimum('temperature')
    @average_voltage = Sample.average('temperature')

    if false
    samples = 0.0
    sum = 1.0
    Sample.find_each do |sample|
      delay = sample.delay

      if delay
        sum += delay
        samples += 1
      end
    end

    @average_sample_delay = sum / samples
    end

    PowerJob.perform_later
  end
end
