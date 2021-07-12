class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '居酒屋' },
    { id: 3, name: '和食' },
    { id: 4, name: 'イタリアン' },
    { id: 5, name: 'ダイニングバー' },
    { id: 6, name: '焼肉' },
    { id: 7, name: 'カフェ' },
    { id: 8, name: '中華' },
    { id: 9, name: 'ラーメン' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :shops
  end