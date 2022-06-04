require_relative '../classes/book-store/label'

describe Label do
  before :each do
    @label = Label.new('Yoga', 'Green')
  end

  context 'check label property and method' do
    it 'check if it is instance of label' do
      expect(@label).to be_instance_of Label
    end

    it 'check if title is yoga' do
      expect(@label.title).to eq 'Yoga'
    end

    it 'check if color is green' do
      expect(@label.color).to eq 'Green'
    end
  end
end
