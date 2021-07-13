class Node
  attr_reader :value
  attr_accessor :leftNode, :rightNode

  def initialize(value)
    @value = value
    @leftNode =nil
    @rightNode =nil
  end

  def addNode(node)
    if node.value < @value
      # push smaller values left
      if @leftNode
        @leftNode = pushNode(node, @leftNode)
      else
        @leftNode = node
      end
    else
      # push bigger values right
      if @rightNode
        @rightNode = pushNode(node, @rightNode)
      else
        @rightNode = node
      end
    end
  end

  def pushNode(new_node, cur_node)
    if new_node.value < cur_node.value
      if cur_node.leftNode.nil?
        cur_node.leftNode = new_node
      else
        cur_node.leftNode = pushNode(new_node, cur_node.leftNode)
      end
    else
      if cur_node.rightNode.nil?
        cur_node.rightNode = new_node
      else
        cur_node.rightNode = pushNode(new_node, cur_node.rightNode)
      end
    end
    cur_node
  end

  def printTree
    if @leftNode
      @leftNode.printTree
    end

    puts @value

    if @rightNode
      @rightNode.printTree
    end
  end
end
