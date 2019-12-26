class Comment < ApplicationRecord
    belongs_to :work_places 
    #入力必須項目content
    validates :content, presence:{message: 'を入力してください。'}
end
