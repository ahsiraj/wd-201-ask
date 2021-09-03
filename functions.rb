# Ruby pgm that renders HTML documnet to the console

html = {
  :tag => "p",
  :text => "This is a paragraph",
}

def render(node)
  if node[:tag] == "p"
    puts "p: "
    puts node[:text]
  end
end

render(html)
#
#

#----------------------
# Recursive
puts "----------------Recursive"
node = {
  :tag => "p",
  :text => "Ruby ruby",
}

html = {
  :tag => "div",
  :children => [node],
}

def render(nodes)
  if nodes[:tag] == "p"
    puts "p: "
    puts nodes[:text]
  elsif nodes[:tag] == "div"
    children = nodes[:children]
    children.each { |child| render(child) }
  end
end

render(html)
#-------------------------------
#Further expansion
puts "--------------Further ------"

node1 = {
  :tag => "h1",
  :text => "Welcome to aicte-lite",
}

node2 = {
  :tag => "div",
  :children => [
    {
      :tag => "h2",
      :text => "The Ruby Language",
    },
    {
      :tag => "p",
      :text => "Ruby is nice",
    },
  ],

}

html = {
  :tag => "div",
  :children => [node1, node2],
}

def render(nodes)
  if nodes[:tag] == "h1"
    puts "**** #{nodes[:text].upcase} ****"
  elsif nodes[:tag] == "h2"
    puts "** #{nodes[:text]} **"
  elsif nodes[:tag] == "p"
    puts nodes[:text]
  elsif nodes[:tag] == "div"
    children = nodes[:children]
    children.each { |child| render(child) }
  end
end

render(html)

=begin
The above code is equivalent tot html code
<div>
  <h1> Welcome to aicte-lite
  <div>
    <h2> The Ruby Language </h2>
    <p> Ruby is nice </p>
  </div>
</div>
=end
