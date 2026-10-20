local compile_and_run_button_picture = {}

local bool_DrawResult = false

function Load_PressCompileAndRun()
  compile_and_run_button_picture = love.graphics.newImage("compile_and_run_button.png")
end

function PressCompileAndRunButton()
  if bool_DrawResult == false then
    bool_DrawResult = true
  end
end

function UpdateLogic_PressCompileAndRun()
  local mx, my = love.mouse.getPosition()

  if mx >= 200 then
    if mx < 200 + 187 then
      if my >= 25 then
        if my < 25 + 166 then
          if love.mouse.isDown(1) then
            PressCompileAndRunButton()
          end
        end
      end
    end
  end
end

function Draw_PressCompileAndRun()
  love.graphics.draw(compile_and_run_button_picture, 200, 25)

  if bool_DrawResult == true then
    love.graphics.print("return 4", 250 + 187, 50)
  end
end