# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    layout 'admin'

    before_action :basic_auth

    def index
      @products = Product.all.page(params[:page]).per(10).recent
    end

    def new
    end

    def create
    end

    def edit
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
