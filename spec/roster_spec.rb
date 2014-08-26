require 'spec_helper'

describe Roster do
  it { should belong_to :team }
  it { should belong_to :player }
  it { should belong_to :position }
end
