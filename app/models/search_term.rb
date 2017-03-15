class SearchTerm
  attr_accessor :value
  include ActiveModel::Validations

  def initialize(value = nil)
    @value = value.try(:downcase)
  end

  validates :value, presence: true
end
