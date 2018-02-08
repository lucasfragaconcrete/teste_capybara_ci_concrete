# encoding: utf-8
# !/usr/bin/env ruby

Dir[File.join(File.dirname(__FILE__), '../pages/*.rb')].each { |file| require file }

module Bazar
  module Pages
    def home
      Bazar::Pages::HomePage.new
    end
  end
end