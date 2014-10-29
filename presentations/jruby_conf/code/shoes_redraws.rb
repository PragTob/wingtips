def add_redraws
  after_every NEED_TO_FLUSH_GUI do app.flush unless app.disposed? end
  after_every NEED_TO_REDRAW_GUI do app.real.redraw unless app.disposed? end
  after_every NEED_TO_ASYNC_FLUSH_GUI do
    @display.asyncExec do app.flush unless app.disposed? end
  end
end