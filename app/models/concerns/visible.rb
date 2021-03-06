# frozen_string_literal: true

# Visible module
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
    validates :user, presence: true
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end

    def private_count
      where(status: 'private').count
    end

    def archived_count
      where(status: 'archived').count
    end

    def nil_count
      where(status: nil).count
    end
  end

  def archived?
    status == 'archived'
  end
end
