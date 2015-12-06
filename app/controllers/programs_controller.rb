class ProgramsController < ApplicationController
  before_filter :set_subnav

  def index; end

  def level_one
    @level = 'Beginner'
    @bootcamps = Bootcamp.beginner.published
  end

  def level_two
    @level = 'Intermediate'
    @bootcamps = Bootcamp.intermediate.published
  end

  def level_three
    @level = 'Advanced'
    @bootcamps = Bootcamp.advanced.published
  end

  def frontend_bootcamp
    @level = 'Frontend'
    @bootcamps = Bootcamp.frontend.published
  end

  private

  def set_subnav
    @nav_items = {
      'Overview' => courses_path
    }
  end
end
