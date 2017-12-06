require 'test_helper'

class DirectoryHelperTest < ActionView::TestCase
  test 'print_tree should return a non empty string' do
    tree = print_tree
    assert tree.present?, "\"#{tree}\" should be a non empty string"
  end
end
