FactoryBot.define do
  factory :post do
    caption '#snow #love'
    image { File.new(Rails.root.join('app', 'assets', 'images', 'snow.jpg')) }
  end
end
