$(function(){
   // この中の処理は、画面表示時に一度だけ実行される

  // nyu-ryokuクラスのものが非表示になる
  $('.nyu-ryoku').hide()
  // hyoujiクラスがクリックされたときの処理を付与する
  $('.hyouji').on('click', function () {
    // this(hyoujiクラスがクリックされたときの処理)がされた時にnyu-ryokuクラスのものがフォーム上に表示される
    $(this).siblings('.nyu-ryoku').show()
    // this(hyoujiクラスがクリックされたときの処理)がされた時にnyu-ryokuクラスの表示されていたものが隠れる
    $(this).hide()
    // つまり、$(this).siblings('.nyu-ryoku').show()と、$(this).hide()が同時に行われている。
  });
  $('.nyu-ryoku')
    .on('focusout', function () {
    $(this).siblings('.hyouji').show()
    $(this).hide()
    $(this).siblings('.hyouji').text($(this).val())
    $.ajax(`/patients/${$(this).data('patient_id')}/observations/${$(this).data('id')}/partial_update`,
    {
      // 変更したデータを保存するためにpostにする
      type: 'post',
      data: {
        // col=どのカラムを更新するかを指定している
        col: $(this).data('col'),
        // value=更新する値をを指定している
        value: $(this).val()
      }
    }).done(function(data) {
      console.log(data)
    })
  });
})

