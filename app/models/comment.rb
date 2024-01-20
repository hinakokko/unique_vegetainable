class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :vegetainable_review

end
