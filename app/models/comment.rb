class Comment < ApplicationRecord
    belongs_to :gossip
    belongs_to :user
    validates :content, 
        presence: true, 
        length: {minimum: 5, maximum: 200, message: "Sois un peu plus bavard stp" }

end
