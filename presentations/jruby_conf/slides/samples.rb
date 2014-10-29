class Samples < Wingtips::Slide

  def after_initialize
    @effects << simple_anim << good_clock << snake << launch_tank_spank
  end

  def content
    headline 'Enough talking!'
  end

  def launch_tank_spank
    proc do
      bullet 'Tanks!'
      demo 'code/expert-tankspank-adjusted.rb'
    end
  end

  def simple_anim
    proc do
      bullet 'A bit of animation'
      demo 'code/good-arc.rb'
    end
  end

  def good_clock
    proc do
      bullet 'A clock'
      demo 'code/good-clock-adjusted.rb'
    end
  end

  def snake
    proc do
      bullet 'snake'
      demo 'code/expert-snake.rb'
    end
  end
end