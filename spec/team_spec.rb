require 'spec_helper'

describe Team do
  it { should have_many :players}
  it { should have_many(:positions).through(:players)}

end
