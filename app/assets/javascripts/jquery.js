$(document).on('turbolinks:load',function(){

  $('.box').click(function(){
    var x = "#" + this.id
    if( $(x).css('background-color') == 'white'){
      $(x).css('background-color', 'green');
    } else {
      $(x).css('background-color', 'white');
    }
  });

});