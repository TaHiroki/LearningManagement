$(function () {

  //使い方ボタン
  explanation();

  //サイドバーの開閉
  sidebar();

  function explanation() {
    $('#explanationbtn').click(function () {
      $('#modalbg').fadeIn();
    });

    $('#closebtn').click(function () {
      $('#modalbg').fadeOut();
    });

    $('#headbarbtn').click(function () {
      $('.bar2').fadeIn(10);
      $('#headbarbtn').fadeOut(10);
    });

    $('#headbarbtn2').click(function () {
      $('.bar2').fadeOut(10);
      $('#headbarbtn').fadeIn(10);
    });
  };


  function sidebar() {
    var duration = 300,
      $side = $('.sidebar');
    var $sideButton = $side.find('button')
      .on('click', function () {
        $side.toggleClass('open');
        if ($side.hasClass('open')) {
          $side.stop(true).animate({
            left: '0px'
          }, duration);
          $side.find('.btn-r')
            .css('display', 'none');
          $side.find('.btn-l')
            .css('display', 'block');
        } else {
          $side.stop(true).animate({
            left: '-330px'
          }, duration);
          $side.find('.btn-r')
            .css('display', 'block');
          $side.find('.btn-l')
            .css('display', 'none');
        };
      });
  };

});