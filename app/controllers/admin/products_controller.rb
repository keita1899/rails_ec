# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    layout 'admin'

    before_action :basic_auth
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all.page(params[:page]).per(10).recent
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      @product.code1 = @product.shuffle_code('A', 'Z', 2)
      @product.code2 = @product.shuffle_code('A', 'Z', 2)
      @product.code3 = @product.shuffle_code('0', '9', 2)

      if @product.save
        redirect_to admin_products_path, notice: "商品「#{@product.name}」を登録しました。"
      else
        render new_admin_product_path(@product), status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "商品「#{@product.name}」を更新しました。"
      else
        render 'admin/products/edit', status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "商品「#{@product.name}」を削除しました。", status: :see_other
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def product_params
      params.require(:product).permit(:name, :description, :min_price, :max_price, :stock, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
