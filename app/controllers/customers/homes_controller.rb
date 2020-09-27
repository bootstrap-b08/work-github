class Customers::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all #where(sale_status: "販売可")
  end
end