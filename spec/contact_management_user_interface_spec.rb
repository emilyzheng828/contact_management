require "../lib/contact_management_user_interface"
require "../lib/contact_management"
require "rspec"

class FakeStdOut < InterfaceUser
  attr_accessor :output

  def initialize
    @output = InterfaceUser.new
  end

  def puts(message)
  end

  def tty?
    true
  end

  def write(message)
  end
end

describe InterfaceUser do
  before do
    $stdout = FakeStdOut.new
    puts $stdout
  end

  after do
    $stdout = STDOUT
  end

  it 'prints the menu' do
    output = InterfaceUser.new
    puts $stdout.menu
    expect($stdout.menu).to eq("------------------------"+"\n")
  end
end
