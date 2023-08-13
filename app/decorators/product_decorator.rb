# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all

  def code
    "#{object.code1}:#{object.code2}-#{object.code3}"
  end
end
