$(function(){

  $('#explanationbtn').click(function(){
    $('#modalbg').fadeIn();
  });

  $('#closebtn').click(function(){
    $('#modalbg').fadeOut();
  });



  /* 　後の更新時の参考に、boxを押すと色が変わる

  $('.box').click(function(){
    if($(this).css('background-color') == 'rgb(255, 255, 255)' ){
      $(this).css('background-color', 'rgb(135, 206, 250');
    }else {
      $(this).css('background-color', 'white');
    }

    var x = $(this).attr('id');
  }); */

});