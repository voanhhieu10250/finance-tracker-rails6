# frozen_string_literal: true

class StocksController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = 'Please enter a valid symbol to search'
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Please enter a symbol to search'
      redirect_to my_portfolio_path
    end
  end
  # rubocop:enable Metrics/MethodLength
end
