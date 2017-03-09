class NotesController < ApplicationController
  def create
    @note = Note.new notes_params
    if @note.save
      render status: 201, json: { success: true }
    else
      render status: :error, json: { success: false, errors: @note.errors.full_messages }
    end
  end

  def show
    @note = Note.find_by(id: params[:id])
    if @note
      render status: :success, json: { success: true, note: @note }
    else
      render statis: 404, json: { success: false, error: 'Note not found' }
    end
  end

  def index
    @notes = MedicalRecord.find_by(id: params[:medical_record])
    render state: :success, json: { success: true, notes: notes }
  end
  
  private

  def notes_params
    params.require(:note).permit(:body, :initials, :medical_record_id)
  end
end