# encoding: utf-8
# !/usr/bin/env ruby

require 'site_prism'

module Bazar
  module Pages
    class HomePage < SitePrism::Page
      element :input_email,       "div[class='coluna span3 esquerda'] input"
      element :btn_enviar,        "div[class='coluna span3 esquerda'] button"

      def enviar_email(email)
        input_email.set(email)
        first("div[class='coluna span3 esquerda'] button").click
      end
    end
  end
end