require 'rails_helper'

RSpec.describe BooksShop, type: :model do
  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:shop) }
end
