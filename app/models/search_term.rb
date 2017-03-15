class SearchTerm
  attr_reader :value
  include ActiveModel::Validations

  def initialize(value = nil)
    @value = value.try(:downcase)
  end

  validates :value, presence: true
end
