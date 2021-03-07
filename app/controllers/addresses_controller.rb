class AddressesController < ApplicationController
  before_action :set_address, only: %i[edit update ]

  def edit
    
  end

  def update
    if @address.update(address_params)
      redirect_to @address.addressable, notice: "Address was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:line, :street, :landmark, :city, :state, :pin_code)
    end
end
