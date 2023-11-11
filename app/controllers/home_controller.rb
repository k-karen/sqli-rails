# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { message: 'Hello World!' }, status: :ok
  end
end
