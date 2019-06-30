// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require_tree .


/*
jQuery(function ($) {
  $('.tabcontent > div').hide();

  $('.tabnav a').click(function () {
    $('.tabcontent > div').hide().filter(this.hash).fadeIn();

    $('.tabnav a').removeClass('active');
    $(this).addClass('active');

    return false;
  }).filter(':eq(0)').click();
});
*/
$(function () {
  // ①タブをクリックしたら発動
  $('.tab li').click(function () {

    // ②クリックされたタブの順番を変数に格納
    var index = $('.tab li').index(this);

    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.tab li').removeClass('active');

    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');

    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.area ul').removeClass('show').eq(index).addClass('show');

  });
});


$(function () {
  $('.js-modal-open').each(function () {
    $(this).on('click', function () {
      var target = $(this).data('target');
      var modal = document.getElementById(target);
      $(modal).fadeIn();
      return false;
    });
  });
  $('.js-modal-close').on('click', function () {
    $('.js-modal').fadeOut();
    return false;
  });
});


$(function () {
  $('.audio-modal-open').each(function () {
    $(this).on('click', function () {
      var target = $(this).data('target');
      var modal = document.getElementById(target);
      $(modal).fadeIn();
      return false;
    });
  });
  $('.audio-modal-close').on('click', function () {
    $('.audio-modal').fadeOut();
    return false;
  });
});


$(function () {
  $('.playBtn').click(function () {
    if ($('#audio1')[0].paused) {
      $('#audio1')[0].play();
      $('.select').removeClass("far fa-play-circle");//playを消す
      $('.select').addClass("far fa-stop-circle");//stopを加える
    } else {
      $('#audio1')[0].pause();
      $('.select').removeClass("far fa-stop-circle");//stopを消す
      $('.select').addClass("far fa-play-circle");//playを加える
    }
  });
});

/*
$(function () {
  // 初期設定
  var options =
  {
    aspectRatio: 1 / 1,
    viewMode: 1,
    crop: function (e) {
      cropData = $('#select-image').cropper("getData");
      $("#upload-image-x").val(Math.floor(cropData.width/2));
      $("#upload-image-y").val(Math.floor(cropData.height/2));
      $("#upload-image-w").val(Math.floor(cropData.width));
      $("#upload-image-h").val(Math.floor(cropData.height));
    },
    zoomable: false,
    minCropBoxWidth: 162,
    minCropBoxHeight: 162
  }

  // 初期設定をセットする
  $('#select-image').cropper(options);

  $("#profile-image").change(function () {
    // ファイル選択変更時に、選択した画像をCropperに設定する
    $('#select-image').cropper('replace', URL.createObjectURL(this.files[0]));
  });
});
*/

$(document).ready(function () {
  var audioSection = $('section#song');
  $('a.play_song').click(function () {


    var audio = $('<audio>', {
      controls: 'controls'
    });


    var url = $(this).attr('href');
    $('<source>').attr('src', url).appendTo(audio);
    audioSection.html(audio);
    return false;
  });
});