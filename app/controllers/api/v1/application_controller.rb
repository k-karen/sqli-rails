# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Cookies
      include Sorcery::Controller
      def form_authenticity_token; end
    end
  end
end
