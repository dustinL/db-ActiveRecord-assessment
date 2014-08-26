require 'spec_helper'

describe Player do
  it { should belong_to :team }
  it { should belong_to :position }
  it { should have_one :roster }

end
