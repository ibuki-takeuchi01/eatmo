class Budget < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '0円〜999円' },
    { id: 3, name: '1,000円〜1,999円' },
    { id: 4, name: '2,000円〜2,999円' },
    { id: 5, name: '3,000円〜3,999円' },
    { id: 6, name: '4,000円〜4,999円' },
    { id: 7, name: '5,000円〜5,999円' },
    { id: 8, name: '6,000円〜7,999円' },
    { id: 9, name: '8,000円〜9,999円' },
    { id: 10, name: '10,000円〜14,999円' },
    { id: 11, name: '15,000円〜19,999円' },
    { id: 12, name: '20,000円〜29,999円' },
    { id: 13, name: '30,000円〜49,999円' },
    { id: 14, name: '50,000円〜99,999円' },
    { id: 15, name: '100,000円〜' }
  ]

  include ActiveHash::Associations
  has_many :shops
  end