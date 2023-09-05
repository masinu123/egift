# OmsForm::Card
module OmsForm
  class Card < ::Card
    validates :name, presence: true
    validate :valid_expires_at

    private

    def valid_expires_at
      return if Time.zone.now < expires_at

      errors.add(:expires_at, :invalid)
    end
  end
end
