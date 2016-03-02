<% if @pilot.valid? -%>
  toastr.success '<%= t('pages.clubs.labels.invite.create') %>'
<% else -%>
  $('#modal-holder .modal-rendered-content').html "<%= escape_javascript render(partial: 'form', locals: { pilot: @pilot, club: @club }) %>"
<% end -%>
