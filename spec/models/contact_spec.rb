require 'spec_helper'

describe Contact do

  before :each do
    @contact = Contact.new(
        name: 'zaru',
        email: 'zaru@example.com'
    )
  end

  it "全てのデータが有効な状態であること" do
    contact = Contact.new(
        name: 'zaru',
        email: 'zaru@example.com'
    )
    expect(contact).to be_valid
  end

  it "全てのデータが有効な状態であること" do
    expect(build(:contact)).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    contact = Contact.new(
        name: nil
    )
    expect(contact).to have(1).errors_on(:name)
  end
  it "メールがなければ無効な状態であること" do
    contact = Contact.new(
        email: nil
    )
    expect(contact).to have(1).errors_on(:email)
  end
  it "重複したメールアドレスなら無効な状態であること" do
    Contact.create(
        name: 'zaru',
        email: 'zaru@example.com'
    )
    contact = Contact.new(
        name: 'tofu',
        email: 'zaru@example.com'
    )
    expect(contact).to have(1).errors_on(:email)
  end
  it "名前付きメールアドレスを返すこと" do
    # contact = Contact.new(
    #     name: 'zaru',
    #     email: 'zaru@example.com'
    # )
    # expect(contact.nameAddr).to eq 'zaru<zaru@example.com>'

    expect(build(:contact).nameAddr).to eq 'zaru<zaru@example.com>'
  end

end