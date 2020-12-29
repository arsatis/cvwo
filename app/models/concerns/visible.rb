module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  # This part is causing issues which idk how to resolve atm
  # included do
  #   validates :status, with: VALID_STATUSES
  # end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
