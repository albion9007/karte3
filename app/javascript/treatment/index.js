$(function(){
  $('.nyu-ryoku').hide()
  $('.add-treat-time').on('click', function () {
    const time = window.prompt("処置や検査時間を入力してください", "")
    if (!time) {
      return
    }
    $.ajax(`/patients/${$(this).data('patient_id')}/treatments/create_new_treatment_data`, {
      type: 'put',
      data: {
        time
      }
    }).done(function() {
      location.reload()
    }).catch(function(e) {
      if (e.responseJSON && e.responseJSON.message) {
        alert(e.responseJSON.message)
      } else {
        alert('予期せぬエラーが発生しました')
      }
    })
  });
  $('.delete-time').on('click', function () {
    $.ajax(`/patients/${$(this).data('patient_id')}/treatments/${$(this).data('id')}/delete`, {
      type: 'delete',
    }).done(function() {
      location.reload()
    })
  })
  $('.hyouji').on('click', function () {
    $(this).siblings('.nyu-ryoku').show()
    $(this).siblings('.nyu-ryoku').trigger('focus')
    $(this).hide()
  });
  $('.nyu-ryoku')
  .on('focusout', function () {
    const col = $(this).data('col')
    $(this).siblings('.hyouji').show()
    $(this).hide()
    $(this).siblings('.hyouji').text($(this).val())
    $.ajax(`/patients/${$(this).data('patient_id')}/treatments/${$(this).data('id')}/treat_partial_update`,
    {
      type: 'post',
      data: {
        col,
        value: $(this).val()
      }
    }).done(function(data) {
      location.reload()
    })
  });
})