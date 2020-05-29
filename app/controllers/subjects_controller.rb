class SubjectsController < ApplicationController
def index
  @subjects = Subject.where(user_id: @current_user.id).order(created_at: :asc)
end

  def new
    @subject = Subject.new
    @chapter = "科目登録"
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = @current_user.id
    @subject.flag = 0

    if @subject.save
      redirect_to users_path, notice: '科目を登録しました！'
    else
      render :new
    end
  end

  def edit
    @chapter = "科目編集"
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      redirect_to users_path, notice: "科目「#{@subject.subject}」を更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to users_path, notice: "科目を削除しました。"

  end

  private

  def subject_params
    params.require(:subject).permit(:subject, :user_id, :count)
  end
end
