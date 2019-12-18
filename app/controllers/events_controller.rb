class EventsController < ApplicationController
  # Задаем объект @event для тех действий, где он нужен
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:show]
  # Здесь уже перечисляем все действия, доступные конкретному юзеру
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: I18n.t('controllers.events.created')
  end

  private

  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
  end

  # Будем искать событие не среди всех,
  # а только у текущего пользователя по id
  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  # редактируем параметры события
  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description)
  end
end