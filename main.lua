local ExampleScript = {}
ExampleScript.title = ""
ExampleScript.content = ""

function Construct_ExampleScript()
  local result = {}
  result.title = ExampleScript.title
  result.content = ExampleScript.content

  return result
end

function LoadJScriptFile(file_name)
  local script = Construct_ExampleScript()
 
  local contents, size = love.filesystem.read(file_name)

  script.title = file_name
  script.content = contents

  return script
end

function love.draw()
    local example_script = LoadJScriptFile("test_j_script.j")
    love.graphics.print(example_script.title, 0, 0)
    love.graphics.print(example_script.content, 0, 20)
end

