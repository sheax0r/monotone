$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'
require 'monotone'

describe Monotone do

  attr_reader :monotone, :file

  before :each do
    @file = double('file')
    Monotone.stub(:file).and_yield file
  end

  it 'should generate the next number' do
    File.should_receive(:read).with(file).and_return '1'
    File.should_receive(:open).with(file, 'w').and_yield file
    file.should_receive(:write).with('2')
    Monotone.next('foo').should eq 2
  end

  it 'should set the number' do
    File.should_receive(:open).with(file, 'w').and_yield(file)
    file.should_receive(:write).with('2')
    Monotone.set('foo', 2)
  end

end