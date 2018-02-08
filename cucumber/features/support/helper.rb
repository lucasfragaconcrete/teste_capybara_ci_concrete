# encoding: utf-8
# !/usr/bin/env ruby

require 'fileutils'

module Helper

    def mouse_over(element_selector)
      element = Capybara.page.driver.browser.find_element(:css, element_selector)
      Capybara.page.driver.browser.mouse.move_to element
    end
    
    def take_screenshot(file_name, result)
      timer_path = Time.now.strftime('%d_%m_%Y').to_s
      file_path = "screenshots/teste_#{result}/data_#{timer_path}"
      screenshot = "#{file_path}/#{file_name}.png"
      page.save_screenshot(screenshot)
      embed(screenshot, 'image/png', 'SCREENSHOT')
    end
end