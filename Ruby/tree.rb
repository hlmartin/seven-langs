class Tree
  attr_accessor :children, :node_name

  def initialize(tree)
    tree.map do |parent, child|
      @node_name = parent
      @children = []
      child.each_pair { |k, v| @children << Tree.new({k => v}) }
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

family = Tree.new( {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 
  'uncle' => {'child 3' => {}, 'child 4' => {}}}} )

#family = Tree.new( {'grandpa' => {'dad' => {}, 'uncle' => {}}})



#ruby_tree = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacRuby", [Tree.new("Meep"), Tree.new("Moop")])])

puts "Visiting a node"
family.visit { |node| puts node.node_name }
puts

puts "Visiting entire tree"
family.visit_all { |node| puts node.node_name }