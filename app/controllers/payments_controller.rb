class PaymentsController < ApplicationController
  include Payola::StatusBehavior

  skip_before_action :redirect_to_payments_if_needed

  def show
    @pack = Pack.first
  end

  def update
    @club = current_club
    if @club.update(update_params)
      subscribe
    else
      render json: { error: @club.errors.full_messages.to_sentence }, status: 400
    end
  end

  private

  def subscribe
    params[:plan] = @club.pack
    params[:stripeEmail] = current_pilot.email
    subscription = Payola::CreateSubscription.call(params, @club)
    @club.save

    render_payola_status(subscription)
  end

  def update_params
    params.require(:club).permit(:pack_id)
  end
end
