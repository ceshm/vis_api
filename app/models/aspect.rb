class Aspect < ApplicationRecord
  belongs_to :parent, class_name: "Aspect", optional: true
  has_many :children, class_name: "Aspect", foreign_key: "parent_id"
  has_and_belongs_to_many :tags
end
