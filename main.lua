require "press_compile_and_run"

local ExampleScript = {}
ExampleScript.title = ""
ExampleScript.content = ""

function Construct_ExampleScript()
  local result = {}
  result.title = ExampleScript.title
  result.content = ExampleScript.content

  return result
end

local example_script = {}

function LoadJScriptFile(file_name)
  local script = Construct_ExampleScript()
 
  local contents, size = love.filesystem.read(file_name)

  script.title = file_name
  script.content = contents

  return script
end

function love.load() 
  example_script = LoadJScriptFile("test_j_script.j")

  Load_PressCompileAndRun()
end

function love.update(dt)
  UpdateLogic_PressCompileAndRun()
end

function love.draw()
    love.graphics.print(example_script.title, 0, 0)
    love.graphics.print(example_script.content, 0, 20)

    Draw_PressCompileAndRun()
end

