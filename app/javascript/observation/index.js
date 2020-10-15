$(function(){
   // この中の処理は、画面表示時に一度だけ実行される
  // nyu-ryokuクラスのものが非表示になる
  $('.nyu-ryoku').hide()
  // add-time-form(id)のものが非表示になる
  $('#add-time-form').hide()
  // open-add-formクラスがクリックされたときの処理を付与する
  $('.open-add-form').on('click', function () {
    // add-time-formが表示される
    $('#add-time-form').show()
  })
  // add-time-formの中のadd-observation-time(追加ボタン)をクリックされたときの処理を付与する
  $('.add-observation-time').on('click', function () {
    // 新しいtimeの空のobservationのデータを作成し、各値を入力可能にする。
    $.ajax(`/patients/${$(this).data('patient_id')}/observations/create_empty_data`, {
      type: 'put',
      // timeには入力した文字列が格納されているので、timeは空ではありません。
      data: {
        // timeプロパティにid="time"に値が格納されたものを代入する？。
        time: $('#time').val(),
        // 追加ボタンに設定されたdata-date="<%= @date %>">の値をコントローラに渡す
        // dateプロパティに$(this).data('date')を代入する。this=add-observation-timeの事。dataメソッドでdata-date="<%= @date %>"の値を取得している。
        date: $(this).data('date')
      }
    }).done(function() {
      // 現在の URL を再読み込みする。
      location.reload()
      // httpステータスコードが400以上の場合（エラーが発生した場合）catchの処理を行う。
    }).catch(function(e) {
      // レスポンスがJSON形式で有り、かつJSONにmessageプロパティが存在するかどうかチェック。
      if (e.responseJSON && e.responseJSON.message) {
        // レスポンスのJSONのmessageプロパティの文字列をアラートで表示。
        alert(e.responseJSON.message)
      } else {
        // 予期した形式のレスポンスでなかった場合のエラーメッセージ。
        alert('予期せぬエラーが発生しました')
      }
    })
  });
  $('.close-add-form').on('click', function () {
    $('#add-time-form').hide()
  })
  // delete-timeをクリックするとメソッドが呼ばれる。
  $('.delete-time').on('click', function () {
    // erbで付与したidとpatient_idをdataに渡し、コントローラー側でdeleteの処理を行う。
    $.ajax(`/patients/${$(this).data('patient_id')}/observations/${$(this).data('id')}/delete`, {
      type: 'delete',
    }).done(function() {
      // 現在の URL を再読み込みする。
      location.reload()
    })
  })
  // hyoujiクラスがクリックされたときの処理を付与する
  $('.hyouji').on('click', function () {
    // this(hyoujiクラスがクリックされたときの処理)がされた時にnyu-ryokuクラスのものがフォーム上に表示される
    $(this).siblings('.nyu-ryoku').show()
    $(this).siblings('.nyu-ryoku').trigger('focus')
    // this(hyoujiクラスがクリックされたときの処理)がされた時にnyu-ryokuクラスの表示されていたものが隠れる
    $(this).hide()
    // つまり、$(this).siblings('.nyu-ryoku').show()と、$(this).hide()が同時に行われている。
  });
  // nyu-ryokuクラスのフォームでキー操作を行った場合の処理。
  $('.nyu-ryoku').on('keypress', function (e) {
    // 押したキーがEnterキーの場合
    if (e.key == 'Enter') {
      // focusoutを強制的に発生させる。→70行目の処理を実行させる。
      $(this).trigger('focusout')
    }
  })
  $('.nyu-ryoku')
    .on('focusout', function () {
    const col = $(this).data('col')
    $(this).siblings('.hyouji').show()
    $(this).hide()
    $(this).siblings('.hyouji').text($(this).val())
    $.ajax(`/patients/${$(this).data('patient_id')}/observations/${$(this).data('id')}/partial_update`,
    {
      // 変更したデータを保存するためにpostにする
      type: 'post',
      data: {
        // col=どのカラムを更新するかを指定している
        col,
        // value=更新する値を指定している
        value: $(this).val()
      }
      // ajaxの処理に成功したらdoneの処理がされる
    }).done(function(data) {
      location.reload()
    })
  });
  // 翌日のボタンが押されたときの処理。
  $('.nextday').on('click', function () {
    // ページのURLを書き換える→location.pathnameは今のページのパス、そのパスに+でdateのパラメータを付与している。
    location.href = location.pathname + '?date=' + calcDate($(this).data('date'), 1)
  })
  // 前日のボタンが押されたときの処理。
  $('.beforeday').on('click', function () {
    // ページのURLを書き換える→location.pathnameは今のページのパス、そのパスに+でdateのパラメータを付与している。
    location.href = location.pathname + '?date=' + calcDate($(this).data('date'), -1)
  })
  // calcDateでstrDateを文字列で渡す、そのstrDateにdayで渡した数値分の日付を+する。
  function calcDate(strDate, day) {
    // 文字列で渡されたstrDateをDate型に変換する。
    const date = new Date(strDate)
    // Date型に対してdayの数値分だけ日付を+する。EX) 1/31+1=1/32 => 2/1になる。
    date.setDate(date.getDate() + day)
    // date.getFullYearで年が取得出来る。date.getMonthで月が取得出来る。date.getDateで日が取得出来る。
    // それぞれを(-)で繋ぎ、2020-9-30と言う文字列が取得出来る。
    // date.getMonth() + 1は1月が0月になるので、+1している。（月だけで、日はOK）。
    return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()
  }
})
