class Payment < ApplicationRecord
  belongs_to :order
  enum status: {initiated: 'initiated', processing: 'processing', success: 'success', declined: 'declined', failed: 'failed'}
end
