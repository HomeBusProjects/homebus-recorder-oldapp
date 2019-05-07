class DashboardController < ApplicationController
  def index
    @samples = Sample.order(created_at: :desc)
  end
end
