require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { is_expected.to have_many(:books_shops).dependent(:destroy) }
  it { is_expected.to have_many(:books).through(:books_shops) }
end
