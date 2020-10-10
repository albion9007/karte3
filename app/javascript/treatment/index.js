$(function(){
  $('.nyu-ryoku').hide()
  $('#add-form').hide()
  $('.open-add-form').on('click', function () {
    $('#add-form').show()
  })
  $('.add-treat-time').on('click', function () {
    $.ajax(`/patients/${$(this).data('patient_id')}/treatments/create_new_treatment_data`, {
      type: 'put',
      data: {
        time: $('#time').val()
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
  $('.close-add-form').on('click', function() {
    $('#add-form').hide()
  }) 
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
  $('.nyu-ryoku').on('keypress', function (e) {
    if (e.key == 'Enter') {
      $(this).trigger('focusout')
    }
  })
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