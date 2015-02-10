class Product < ActiveRecord::Base
validates :discription, :name, presense: true
validates :price_in_cents, numericality: { only_integer: true, greater_than: 0}
end
