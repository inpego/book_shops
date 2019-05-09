require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to belong_to(:publisher) }
  it { is_expected.to have_many(:books_shops).dependent(:destroy) }
  it { is_expected.to have_many(:shops).through(:books_shops) }
end
