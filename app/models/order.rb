class Order < ApplicationRecord
  has_many :payments
  enum status: {placed: 'placed', accepted: 'accepted', declined: 'declined', processing: 'processing', delivered: 'delivered', ready: 'ready'}
end
