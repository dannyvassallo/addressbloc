require_relative "controllers/menu_controller"

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu
entries.count
p entries.all
