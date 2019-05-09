# frozen_string_literal: true

class PublishersController < ApplicationController
  def show
    render json: Shops::ListService.new(params[:id]).call
  end
end
