$(function () {

  //使い方ボタン
  explanation();

  //サイドバーの開閉
  sidebar();

  //達成率
  activateScene2();


  //関数群
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

  function activateScene2() {
    var $content = $('#scene-2-content'),
      $charts = $content.find('.chart');

    $charts.each(function () {

      var $chart = $(this),
        $circleLeft = $chart.find('.left .circle-mask-inner')
        .css({
          transform: 'rotate(0)'
        }),
        $circleRight = $chart.find('.right .circle-mask-inner')
        .css({
          transform: 'rotate(0)'
        });

      var flag = $chart.find('.flag').text(),
        count = $chart.find('.count').text(),
        percentData = flag / count,
        name = $chart.find('.name').text(),
        $color = $chart.find('.circle-body');

      switch (name) {
        case '英語':
          $color.css('background-color', '#ff6633');
          break;
        case 'リスニング':
          $color.css('background-color', '#ffcc33');
          break;
        case '数学':
          $color.css('background-color', '#0078ff');
          break;
        case '国語':
          $color.css('background-color', '#ffaaff');
          break;
        case '理科':
          $color.css('background-color', '#66ff33');
          break;
        case '社会':
          $color.css('background-color', '#663300');
          break;
        case 'その他':
          $color.css('background-color', '#000000');
          break;
      }

      $({
        percent: 0
      }).delay(1000).animate({
        percent: percentData
      }, {
        duration: 1500,
        progress: function () {
          var now = this.percent,
            deg = now * 360,
            degRight = Math.min(Math.max(deg, 0), 180),
            degLeft = Math.min(Math.max(deg - 180, 0), 180);
          $circleRight.css({
            transform: 'rotate(' + degRight + 'deg)'
          });
          $circleLeft.css({
            transform: 'rotate(' + degLeft + 'deg)'
          });
        }
      });
    });
  };


});