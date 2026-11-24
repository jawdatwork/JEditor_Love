require "press_compile_and_run"
require "compile_jassem"

local ExampleScript = {}
ExampleScript.title = ""
ExampleScript.content = ""

local example_jassem_source_code = nil
local example_jassem_bytecode_file = nil

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

  local source_code, bytecode_file = TestApp_CompileExampleScript()
  example_jassem_source_code = source_code
  example_jassem_bytecode_file = bytecode_file
end

function love.update(dt)
  UpdateLogic_PressCompileAndRun()
end

function love.draw()
    love.graphics.print(example_script.title, 0, 0)
    love.graphics.print(example_script.content, 0, 20)

    Draw_PressCompileAndRun()

    love.graphics.print("example jassem script", 0, 200)
    love.graphics.print(example_jassem_source_code.line0, 0, 220)
    love.graphics.print(example_jassem_source_code.line1, 0, 240)
    love.graphics.print(example_jassem_source_code.line2, 0, 260)
    
    local line0_bytes_string = BytecodeLineToString(example_jassem_bytecode_file.line0)
    local line1_bytes_string = BytecodeLineToString(example_jassem_bytecode_file.line1)
    local line2_bytes_string = BytecodeLineToString(example_jassem_bytecode_file.line2)

    love.graphics.print("example jassem bytecode", 200, 200)
    love.graphics.print(line0_bytes_string, 200, 220)
    love.graphics.print(line1_bytes_string, 200, 240)
    love.graphics.print(line2_bytes_string, 200, 260)
end

