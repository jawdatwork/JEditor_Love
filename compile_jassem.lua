local SourceCode = {}
SourceCode.line0 = ""
SourceCode.line1 = ""
SourceCode.line2 = ""

local BytecodeFile = {}
BytecodeFile.line0 = {}
BytecodeFile.line1 = {}
BytecodeFile.line2 = {}

BytecodeFile.line0.elem0 = 0
BytecodeFile.line0.elem1 = 0
BytecodeFile.line0.elem2 = 0

BytecodeFile.line1.elem0 = 0
BytecodeFile.line1.elem1 = 0
BytecodeFile.line1.elem2 = 0

BytecodeFile.line2.elem0 = 0
BytecodeFile.line2.elem1 = 0
BytecodeFile.line2.elem2 = 0

function SourceCode_constr()
  local my_copy = {}
  my_copy.line0 = SourceCode.line0
  my_copy.line1 = SourceCode.line1
  my_copy.line2 = SourceCode.line2

  return my_copy
end

function BytecodeFile_constr()
  local my_copy = {}

  my_copy.line0 = BytecodeFile.line0
  my_copy.line1 = BytecodeFile.line1
  my_copy.line2 = BytecodeFile.line2

  return my_copy
end

function CompileJAssemScript(sourceCode)
  
end

function TestApp_CompileExampleScript()
  local example_source = SourceCode_constr()
  local example_bytecode = BytecodeFile_constr()

  example_source.line0 = "myVariable"
  example_source.line1 = "5"
  example_source.line2 = "\n"

  local myVariable_string = "myVariable"
  local myVariable_japp_message = 801

  local myVariable_value_number = 5
  local myVariable_value_japp_message = 802

  local newline_message = "\n"
  local newline_japp_message = 803

  example_bytecode.line0.elem0 = 568
  example_bytecode.line0.elem1 = 801

  example_bytecode.line1.elem0 = 568
  example_bytecode.line1.elem1 = 802

  example_bytecode.line2.elem0 = 568
  example_bytecode.line2.elem1 = 803

  return example_source, example_bytecode
end

function BytecodeLineToString(bc_line)
  local result_s = ""

  local s = ""
  s = tostring(bc_line.elem0)
  result_s = result_s .. s

  s = tostring(bc_line.elem1)
  result_s = result_s .. " "
  result_s = result_s .. s

  s = tostring(bc_line.elem2)
  result_s = result_s .. " "
  result_s = result_s .. s

  return result_s
end