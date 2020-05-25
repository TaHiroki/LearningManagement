class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = @current_user.id
    @subject.save
    redirect_to users_path, notice: '科目を登録しました！'
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:subject, :user_id, :count)
  end
end
