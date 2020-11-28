# Test
# frozen_string_literal: true

class TestController < ApplicationController
  # lalala
  def index
    render json: { "id": 1, "text": 'prueba' }
  end
end
