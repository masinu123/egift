# OmsForm::User
module OmsForm
  class User < ::User
    validate :valid_payout_rate

    private

    def valid_payout_rate
      payout_rate = payout_rate.to_f
      return if 0 <= payout_rate && payout_rate <= 1

      errors.add(:payout_rate, :invalid)
    end
  end
end
