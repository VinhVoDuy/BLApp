class Admin::ContactsController < AdminController
  def index

  end

  def upload
    sheet = Roo::Excelx.new params[:file].tempfile.to_path.to_s
    sheet.each_row_streaming(pad_cells: true, offset: 1) do |row|
      email = row[3].value
      full_name = row[2]
      contact = Contact.find_or_create_by(email: email)
      if full_name.present?
        contact.update_attributes(full_name: full_name.value)
      else
        contact.update_attributes(full_name: email.split('@').first, inferred: true)
      end
    end

    redirect_to action: :index
  end
end
