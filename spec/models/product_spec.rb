require 'rails_helper'

# unit testing spec

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :details }
  it { should validate_presence_of :cost }
  it { should belong_to :user }
end
