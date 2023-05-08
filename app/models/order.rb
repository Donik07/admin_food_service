class Order < ApplicationRecord
  belongs_to :account
  belongs_to :point

  # after_initialize :init_defaults

  protected
  # def init_defaults
    # if respond_to?(:stage)
  # end
end
