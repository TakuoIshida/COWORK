class WorkPlace < ApplicationRecord
  #後で必要に応じてアソシエーションを設定する
  belongs_to :user
  has_many :comments , dependent: :destroy
  
  #入力必須項目(name,region,tel)
  validates :name, :region, :tel, presence:{message:'は必須項目です。入力してください'}
  #TEL ⇒重複不可,入力必須
  validates :tel, uniqueness:{message:'はすでに使用されています'}
  #TEL ⇒数値入力に限定
  validates :tel, numericality:{message:'は数値で入力してください'}
  #URL ⇒ URL認証
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/,allow_blank: true

    #img uploader
  # mount_uploader :image, ImageUploader
  # 曖昧検索用メソッド
  def self.search(search)
    return WorkPlace.order(created_at: "DESC").limit(24) unless search
    WorkPlace.where('LOWER(name) LIKE ?', "%#{[search].downcase}%")
  end
end
