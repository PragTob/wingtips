class PluggableBackend < Slide
  def content
    headline 'Pluggable Backend'
    dsl_length = 400
    dsl_top = 300
    rect_height = 100
    backend_length = 600
    backend_top = 500
    dsl_rect = rect center_x(dsl_length), dsl_top, dsl_length, rect_height, fill: green
    backend_rect = rect center_x(backend_length), backend_top, backend_length, rect_height, fill: blue
    dsl_text = para 'DSL', size: BULLET_POINT_SIZE
    backend_text = para 'Backend', size: BULLET_POINT_SIZE
    center_text_on dsl_text, dsl_rect
    center_text_on backend_text, backend_rect
    app.gui.flush
  end

  def center_x(length)
    width/2 - length/ 2
  end

  def center_text_on(text, rectangle)
    new_left = rectangle.left + rectangle.width / 2 - text.width / 2
    new_top = rectangle.top + rectangle.height / 2 - text.height / 2
    text.move new_left, new_top
  end
end