class Slide

  attr_reader :app

  def initialize(app)
    @app = app
    after_initialize
  end

  def content
    # implemented by subclasses
  end

  # copied from the URL implementation... weird but I want to have
  # classes not methods for this
  def method_missing(method, *args, &blk)
    if app_should_handle_method? method
      app.send(method, *args, &blk)
    else
      super
    end
  end

  private
  def after_initialize
    # subclasses if an after hook is needed
  end

  def app_should_handle_method? method_name
    !self.respond_to?(method_name) && app.respond_to?(method_name)
  end

end