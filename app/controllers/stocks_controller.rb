# frozen_string_literal: true

class StocksController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
        # render 'users/my_portfolio'
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol to search'
          format.js { render partial: 'users/result' }
        end
        # redirect_to my_portfolio_path
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/result' }
      end
      # redirect_to my_portfolio_path
    end
  end
  # rubocop:enable Metrics/MethodLength
end
