class Flow < ApplicationRecord
  belongs_to :prototype, optional: true
  belongs_to :processing, optional: true
end
