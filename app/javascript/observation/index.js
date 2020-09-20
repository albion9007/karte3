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
        // value=更新する値をを指定している
        value: $(this).val()
      }
      // ajaxの処理に成功したらdoneの処理がされる
    }).done(function(data) {
      // erbファイルの中に有るline_chartのidを指定してchartのオブジェクトを取り出す
      // ex)col = temperature の文字列が入る
      // Chartkick(グローバルなオブジェクト)にcharts[col + "-chart"](chartsは連想配列(キー毎にオブジェクトを格納する事が出来るもの)でcol + "-chart"はキー：キーを指定する事でchartのオブジェクトを取得する事が出来る)
      const chart = Chartkick.charts[col + "-chart"]
      // chartのデータを更新する
      chart.updateData(
        // レスポンスに有るfunction(data)の値がdata.chart_dataとして返ってくる。
        data.chart_data
      )
      console.log(data)
    })
  });
})

