require 'spec_helper'

describe Position do
  it { should have_many :players}
  it { should have_many :rosters}
end
